import Foundation
import WasmInterpreter

public struct ImportedAddModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: ImportedAddModule.wasm)
        try _vm.importNativeFunction(
            named: "imported_add_func",
            namespace: "imports",
            signature: "i(i I)",
            intoModuleNamed: "imports",
            nativeFunction: importedAdd
        )
    }

    func askModuleToCallImportedFunction() throws -> Int {
        return Int(try _vm.call("integer_provider_func", args: []) as Int32)
    }

    private var importedAdd: ImportedFunctionSignature {
        return { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let args = try ImportedFunction.arguments(withTypes: [.int32, .int64], from: stack)
                guard args.count == 2 else { throw WasmInterpreterError.incorrectArguments(args) }
                guard case .int32(let first) = args[0], case .int64(let second) = args[1] else {
                    throw WasmInterpreterError.incorrectArguments(args)
                }
                let sum = Int32(Int64(first) + second)
                try ImportedFunction.pushReturnValue(.int32(sum), to: stack)
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/imported-add.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 =
            "AGFzbQEAAAABCwJgAn9+AX9gAAF/Ah0BB2ltcG9ydHMRaW1wb3J0ZWRfYWRkX2Z1bmMAAAMCAQEHGQEVaW50ZWdlcl9wcm92aWRlcl9mdW5jAAEKCwEJAEH7ZUIqEAAL"
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
