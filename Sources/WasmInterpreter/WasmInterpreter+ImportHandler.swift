import Foundation
import CWasm3

extension WasmInterpreter {
    public func addImportHandler(
        named name: String,
        namespace: String,
        block: @escaping () throws -> Void
    ) throws {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                try block()
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature()
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler(
        named name: String,
        namespace: String,
        block: @escaping (UnsafeMutableRawPointer?) throws -> Void
    ) throws {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                try block(heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature()
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Ret>(
        named name: String,
        namespace: String,
        block: @escaping () throws -> Ret
    ) throws where Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let ret = try block()
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(ret: Ret.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Ret>(
        named name: String,
        namespace: String,
        block: @escaping (UnsafeMutableRawPointer?) throws -> Ret
    ) throws where Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let ret = try block(heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(ret: Ret.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Arg1>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1) throws -> Void
    ) throws where Arg1: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                try block(arg1)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Arg1>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, UnsafeMutableRawPointer?) throws -> Void
    ) throws where Arg1: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                try block(arg1, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Arg1, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let ret = try block(arg1)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, ret: Ret.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Arg1, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, UnsafeMutableRawPointer?) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let ret = try block(arg1, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, ret: Ret.self)
        try self.importNativeFunction(
            named: name,
            namespace: namespace,
            signature: sig,
            handler: importedFunction
        )
    }

    public func addImportHandler<Arg1, Arg2>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2) throws -> Void
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                try block(arg1, arg2)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, UnsafeMutableRawPointer?) throws -> Void
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                try block(arg1, arg2, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let ret = try block(arg1, arg2)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, UnsafeMutableRawPointer?) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let ret = try block(arg1, arg2, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3) throws -> Void
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                try block(arg1, arg2, arg3)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, UnsafeMutableRawPointer?) throws -> Void
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                try block(arg1, arg2, arg3, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let ret = try block(arg1, arg2, arg3)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, UnsafeMutableRawPointer?) throws -> Ret
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Ret: WasmTypeProtocol {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let ret = try block(arg1, arg2, arg3, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Arg4: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                try block(arg1, arg2, arg3, arg4)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, UnsafeMutableRawPointer?) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Arg4: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                try block(arg1, arg2, arg3, arg4, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let ret = try block(arg1, arg2, arg3, arg4)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, UnsafeMutableRawPointer?) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let ret = try block(arg1, arg2, arg3, arg4, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, ret: Ret.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                try block(arg1, arg2, arg3, arg4, arg5)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, arg5: Arg5.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, UnsafeMutableRawPointer?) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                try block(arg1, arg2, arg3, arg4, arg5, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, arg5: Arg5.self)
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let ret = try block(arg1, arg2, arg3, arg4, arg5)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, arg5: Arg5.self, ret: Ret.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, UnsafeMutableRawPointer?) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let ret = try block(arg1, arg2, arg3, arg4, arg5, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self, arg5: Arg5.self, ret: Ret.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, Arg6) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let arg6: Arg6 = try NativeFunction.argument(from: stack, at: 5)
                try block(arg1, arg2, arg3, arg4, arg5, arg6)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self,
            arg4: Arg4.self, arg5: Arg5.self, arg6: Arg6.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, UnsafeMutableRawPointer?) throws -> Void
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let arg6: Arg6 = try NativeFunction.argument(from: stack, at: 5)
                try block(arg1, arg2, arg3, arg4, arg5, arg6, heap)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self,
            arg4: Arg4.self, arg5: Arg5.self, arg6: Arg6.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, Arg6) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let arg6: Arg6 = try NativeFunction.argument(from: stack, at: 5)
                let ret = try block(arg1, arg2, arg3, arg4, arg5, arg6)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self,
            arg5: Arg5.self, arg6: Arg6.self, ret: Ret.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }

    public func addImportHandler<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Ret>(
        named name: String,
        namespace: String,
        block: @escaping (Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, UnsafeMutableRawPointer?) throws -> Ret
    ) throws
        where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
        Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        let importedFunction: ImportedFunctionSignature =
        { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let arg1: Arg1 = try NativeFunction.argument(from: stack, at: 0)
                let arg2: Arg2 = try NativeFunction.argument(from: stack, at: 1)
                let arg3: Arg3 = try NativeFunction.argument(from: stack, at: 2)
                let arg4: Arg4 = try NativeFunction.argument(from: stack, at: 3)
                let arg5: Arg5 = try NativeFunction.argument(from: stack, at: 4)
                let arg6: Arg6 = try NativeFunction.argument(from: stack, at: 5)
                let ret = try block(arg1, arg2, arg3, arg4, arg5, arg6, heap)
                try NativeFunction.pushReturnValue(ret, to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
        let sig = try signature(
            arg1: Arg1.self, arg2: Arg2.self, arg3: Arg3.self, arg4: Arg4.self,
            arg5: Arg5.self, arg6: Arg6.self, ret: Ret.self
        )
        try self.importNativeFunction(named: name, namespace: namespace, signature: sig, handler: importedFunction)
    }
}
