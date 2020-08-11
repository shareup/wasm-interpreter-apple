import Foundation
import WasmInterpreter

public struct AddModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: AddModule.wasm)
    }

    func add(_ first: Int, _ second: Int) throws -> Int {
        return Int(try _vm.call("add", args: [String(first), String(second)]) as Int32)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/add.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAABBwFgAn9/AX8DAgEABwcBA2FkZAAACgkBBwAgACABags="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
