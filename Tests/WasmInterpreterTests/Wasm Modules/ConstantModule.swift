import Foundation
import WasmInterpreter

public struct ConstantModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: ConstantModule.wasm)
    }

    func constant1() throws -> Int {
        return Int(try _vm.call("constant_1") as Int32)
    }

    func constant2() throws -> Int {
        return Int(try _vm.call("constant_2") as Int32)
    }

    func constant3() throws -> Int {
        return Int(try _vm.call("constant_3") as Int32)
    }

    func constant4() throws -> Int {
        return Int(try _vm.call("constant_4") as Int32)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/constant.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAABBQFgAAF/AwIBAAc1BApjb25zdGFudF8xAAAKY29uc3RhbnRfMgAACmNvbnN0YW50XzMAAApjb25zdGFudF80AAAKCAEGAEGAgAQL"
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
