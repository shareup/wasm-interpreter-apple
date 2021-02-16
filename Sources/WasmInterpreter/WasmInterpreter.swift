import Foundation
import CWasm3
import Synchronized

public final class WasmInterpreter {
    private var _environment: IM3Environment
    private var _runtime: IM3Runtime
    private var _moduleAndBytes: (IM3Module, [UInt8])
    private var _module: IM3Module { _moduleAndBytes.0 }

    private var _functionCache = [String: IM3Function]()
    private var _importedFunctionContexts = [UnsafeMutableRawPointer]()

    private let _lock = Lock()

    public convenience init(module: URL) throws {
        try self.init(stackSize: 512 * 1024, module: module)
    }

    public convenience init(stackSize: UInt32, module: URL) throws {
        try self.init(stackSize: stackSize, module: Array<UInt8>(try Data(contentsOf: module)))
    }

    public convenience init(module bytes: [UInt8]) throws {
        try self.init(stackSize: 512 * 1024, module: bytes)
    }

    public init(stackSize: UInt32, module bytes: [UInt8]) throws {
        guard let environment = m3_NewEnvironment() else {
            throw WasmInterpreterError.couldNotLoadEnvironment
        }

        guard let runtime = m3_NewRuntime(environment, stackSize, nil) else {
            throw WasmInterpreterError.couldNotLoadRuntime
        }

        var mod: IM3Module?
        try WasmInterpreter.check(m3_ParseModule(environment, &mod, bytes, UInt32(bytes.count)))
        guard let module = mod else { throw WasmInterpreterError.couldNotParseModule }
        try WasmInterpreter.check(m3_LoadModule(runtime, module))

        _environment = environment
        _runtime = runtime
        _moduleAndBytes = (module, bytes)
    }

    deinit {
        m3_FreeRuntime(_runtime)
        m3_FreeEnvironment(_environment)
        removeImportedFunctions(for: _importedFunctionContexts)
    }

    public func heap() throws -> Heap {
        let totalBytes = UnsafeMutablePointer<UInt32>.allocate(capacity: 1)
        defer { totalBytes.deallocate() }

        guard let bytesPointer = m3_GetMemory(_runtime, totalBytes, 0) else {
            throw WasmInterpreterError.invalidMemoryAccess
        }

        return Heap(pointer: bytesPointer, size: Int(totalBytes.pointee))
    }

    public func dataFromHeap(offset: Int, length: Int) throws -> Data {
        let heap = try self.heap()

        guard heap.isValid(offset: offset, length: length)
        else { throw WasmInterpreterError.invalidMemoryAccess }

        return Data(bytes: heap.pointer.advanced(by: offset), count: length)
    }

    public func stringFromHeap(offset: Int, length: Int) throws -> String {
        let data = try dataFromHeap(offset: offset, length: length)
        guard let string = String(data: data, encoding: .utf8) else {
            throw WasmInterpreterError.invalidUTF8String
        }
        return string
    }

    public func valueFromHeap<T: WasmTypeProtocol>(offset: Int) throws -> T {
        let values = try valuesFromHeap(offset: offset, length: 1) as [T]
        guard let value = values.first
        else { throw WasmInterpreterError.couldNotLoadMemory }
        return value
    }

    public func valuesFromHeap<T: WasmTypeProtocol>(offset: Int, length: Int) throws -> [T] {
        let heap = try self.heap()

        guard heap.isValid(offset: offset, length: length)
        else { throw WasmInterpreterError.invalidMemoryAccess }

        return heap.pointer
            .advanced(by: offset)
            .withMemoryRebound(
                to: T.self,
                capacity: length
            ) { (pointer: UnsafeMutablePointer<T>) -> [T] in
                return (0..<length).map { pointer.advanced(by: $0).pointee }
            }
    }

    public func writeToHeap(data: Data, offset: Int) throws {
        let heap = try self.heap()

        guard heap.isValid(offset: offset, length: data.count)
        else { throw WasmInterpreterError.invalidMemoryAccess }

        try data.withUnsafeBytes { (rawPointer: UnsafeRawBufferPointer) -> Void in
            guard let pointer = rawPointer.bindMemory(to: UInt8.self).baseAddress
            else { throw WasmInterpreterError.couldNotBindMemory }
            heap.pointer
                .advanced(by: offset)
                .initialize(from: pointer, count: data.count)
        }
    }

    public func writeToHeap(string: String, offset: Int) throws {
        try writeToHeap(data: Data(string.utf8), offset: offset)
    }

    public func writeToHeap<T: WasmTypeProtocol>(value: T, offset: Int) throws {
        try writeToHeap(values: [value], offset: offset)
    }

    public func writeToHeap<T: WasmTypeProtocol>(values: Array<T>, offset: Int) throws {
        var values = values
        try writeToHeap(
            data: Data(bytes: &values, count: values.count * MemoryLayout<T>.size),
            offset: offset
        )
    }
}

typealias ImportedFunctionSignature = (UnsafeMutablePointer<UInt64>?, UnsafeMutableRawPointer?) -> UnsafeRawPointer?

extension WasmInterpreter {
    /// Imports the specified block into the module matching the supplied name. The
    /// imported block must be included in the compiled module as an `import`.
    ///
    /// The function's signature must conform to `wasm3`'s format, which matches the following
    /// form:
    ///
    /// ```c
    /// u8  ConvertTypeCharToTypeId (char i_code)
    /// {
    ///     switch (i_code) {
    ///     case 'v': return c_m3Type_void;
    ///     case 'i': return c_m3Type_i32;
    ///     case 'I': return c_m3Type_i64;
    ///     case 'f': return c_m3Type_f32;
    ///     case 'F': return c_m3Type_f64;
    ///     case '*': return c_m3Type_ptr;
    ///     }
    ///     return c_m3Type_none;
    /// }
    /// ```
    ///
    /// For example, a block taking two arguments of types `Int64` and `Float32` and
    /// no return value would have this signature: `v(I f)`
    ///
    /// - Throws: Throws if a module matching the given name can't be found or if the
    /// underlying `wasm3` function returns an error.
    ///
    /// - Parameters:
    ///   - name: The name of the function to import, matching the name specified inside the
    ///   WebAssembly module.
    ///   - namespace: The namespace of the function to import, matching the namespace
    ///   specified inside the WebAssembly module.
    ///   - signature: The signature of the function to import, conforming to `wasm3`'s guidelines
    ///   as outlined above.
    ///   - handler: The function to import into the specified WebAssembly module.
    func importNativeFunction(
        named name: String,
        namespace: String,
        signature: String,
        handler: @escaping ImportedFunctionSignature
    ) throws {
        guard let context = UnsafeMutableRawPointer(bitPattern: (namespace + name).hashValue) else {
            throw WasmInterpreterError.couldNotGenerateFunctionContext
        }

        do {
            setImportedFunction(handler, for: context)
            try WasmInterpreter.check(
                m3_LinkRawFunctionEx(_module, namespace, name, signature, handleImportedFunction, context)
            )
            _lock.locked { _importedFunctionContexts.append(context) }
        } catch {
            removeImportedFunction(for: context)
            throw error
        }
    }
}

extension WasmInterpreter {
    func function(named name: String) throws -> IM3Function {
        return try _lock.locked { () throws -> IM3Function in
            if let compiledFunction = _functionCache[name] {
                return compiledFunction
            } else {
                var f: IM3Function?
                try WasmInterpreter.check(m3_FindFunction(&f, _runtime, name))
                guard let function = f else { throw WasmInterpreterError.couldNotFindFunction(name) }
                _functionCache[name] = function
                return function
            }
        }
    }

    func _call(_ function: IM3Function, args: [String]) throws {
        try args.withCStrings { (cStrings) throws -> Void in
            var mutableCStrings = cStrings
            let size = UnsafeMutablePointer<Int>.allocate(capacity: 1)
            let r = wasm3_CallWithArgs(function, UInt32(args.count), &mutableCStrings, size, nil)
            if let result = r {
                throw WasmInterpreterError.onCallFunction(String(cString: result))
            } else if 0 != size.pointee {
                throw WasmInterpreterError.invalidFunctionReturnType
            } else {
                return ()
            }
        }
    }

    func _call<T: WasmTypeProtocol>(_ function: IM3Function, args: [String]) throws -> T {
        try args.withCStrings { (cStrings) throws -> T in
            var mutableCStrings = cStrings
            let size = UnsafeMutablePointer<Int>.allocate(capacity: 1)
            let output = UnsafeMutablePointer<T>.allocate(capacity: 1)
            let r = wasm3_CallWithArgs(function, UInt32(args.count), &mutableCStrings, size, output)
            if let result = r {
                throw WasmInterpreterError.onCallFunction(String(cString: result))
            } else if MemoryLayout<T>.size != size.pointee {
                throw WasmInterpreterError.invalidFunctionReturnType
            } else {
                return output.pointee
            }
        }
    }
}

extension WasmInterpreter {
    private static func check(_ block: @autoclosure () throws -> M3Result?) throws {
        if let result = try block() {
            throw WasmInterpreterError.wasm3Error(String(cString: result))
        }
    }
}

private let importedFunctionLock = Lock()
private var contextToImportedFunction = Dictionary<UnsafeMutableRawPointer, ImportedFunctionSignature>()

private func setImportedFunction(_ function: @escaping ImportedFunctionSignature, for context: UnsafeMutableRawPointer) {
    importedFunctionLock.locked { contextToImportedFunction[context] = function }
}

private func removeImportedFunction(for context: UnsafeMutableRawPointer) {
    importedFunctionLock.locked { _ = contextToImportedFunction.removeValue(forKey: context) }
}

private func removeImportedFunctions(for contexts: [UnsafeMutableRawPointer]) {
    importedFunctionLock.locked { contexts.forEach { contextToImportedFunction.removeValue(forKey: $0) } }
}

private func importedFunction(for context: UnsafeMutableRawPointer?) -> ImportedFunctionSignature? {
    guard let context = context else { return nil }
    return importedFunctionLock.locked { contextToImportedFunction[context] }
}

private func handleImportedFunction(
    _ runtime: UnsafeMutablePointer<M3Runtime>?,
    _ stackPointer: UnsafeMutablePointer<UInt64>?,
    _ heap: UnsafeMutableRawPointer?,
    _ context: UnsafeMutableRawPointer?
) -> UnsafeRawPointer? {
    guard let function = importedFunction(for: context) else { return UnsafeRawPointer(m3Err_trapUnreachable) }
    return function(stackPointer, heap)
}
