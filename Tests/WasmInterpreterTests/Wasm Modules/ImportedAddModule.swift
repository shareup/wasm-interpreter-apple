import Foundation
import WasmInterpreter

public struct ImportedAddModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: ImportedAddModule.wasm)
        try _vm.addImportHandler(
            named: "imported_add_func",
            namespace: "imports",
            block: self.importedAdd
        )
    }

    func askModuleToCallImportedFunction() throws -> Int {
        return Int(try _vm.call("integer_provider_func", args: []) as Int32)
    }

    private var importedAdd: (Int32, Int64) -> Int32 {
        return { return Int32(Int64($0) + $1) }
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/imported-add.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 =
            "AGFzbQEAAAABCwJgAn9+AX9gAAF/Ah0BB2ltcG9ydHMRaW1wb3J0ZWRfYWRkX2Z1bmMAAAMCAQEHGQEVaW50ZWdlcl9wcm92aWRlcl9mdW5jAAEKCwEJAEH7ZUIqEAAL"
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
