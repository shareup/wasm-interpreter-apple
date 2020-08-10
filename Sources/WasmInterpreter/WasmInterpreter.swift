import Foundation
import CWasm3

public final class WasmInterpreter {
    private var _environment: IM3Environment
    private var _runtime: IM3Runtime

    private var _moduleCache = [IM3Module: [UInt8]]()
    private var _functionCache = [String: IM3Function]()

    public convenience init() throws {
        try self.init(stackSize: 512 * 1024)
    }

    public init(stackSize: UInt32) throws {
        guard let environment = m3_NewEnvironment() else {
            throw WasmInterpreterError.couldNotLoadEnvironment
        }

        guard let runtime = m3_NewRuntime(environment, stackSize, nil) else {
            throw WasmInterpreterError.couldNotLoadRuntime
        }

        _environment = environment
        _runtime = runtime
    }

    deinit {
        m3_FreeRuntime(_runtime)
        m3_FreeEnvironment(_environment)
        _moduleCache.removeAll()
    }

    public func loadModule(at url: URL) throws {
        try loadModule(Array<UInt8>(try Data(contentsOf: url)))
    }

    public func loadModule(_ bytes: [UInt8]) throws {
        var mod: IM3Module?
        try check(m3_ParseModule(_environment, &mod, bytes, UInt32(bytes.count)))
        guard let module = mod else { throw WasmInterpreterError.couldNotParseModule }
        try check(m3_LoadModule(_runtime, module))
        _moduleCache[module] = bytes
    }

    public func call(_ name: String, args: [String]) throws {
        try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> Int64 {
        return try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> UInt64 {
        return try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> Int32 {
        return try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> UInt32 {
        return try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> Double {
        return try _call(try function(named: name), args: args)
    }

    public func call(_ name: String, args: [String]) throws -> Float {
        return try _call(try function(named: name), args: args)
    }
}

extension WasmInterpreter {
    private func function(named name: String) throws -> IM3Function {
        if let compiledFunction = _functionCache[name] {
            return compiledFunction
        } else {
            var f: IM3Function?
            try check(m3_FindFunction(&f, _runtime, name))
            guard let function = f else { throw WasmInterpreterError.couldNotFindFunction(name) }
            _functionCache[name] = function
            return function
        }
    }

    private func _call(_ function: IM3Function, args: [String]) throws {
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

    private func _call<T>(_ function: IM3Function, args: [String]) throws -> T {
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
    private func check(_ block: @autoclosure () throws -> M3Result?) throws {
        if let result = try block() {
            throw WasmInterpreterError.wasm3Error(String(cString: result))
        }
    }
}
