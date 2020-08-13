import Foundation
import WasmInterpreter

public struct FibonacciModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(stackSize: 1 * 1024 * 1024, module: FibonacciModule.wasm)
    }

    func calculateValue(at index: Int) throws -> Int {
        return Int(try _vm.call("fib", Int64(index)) as Int64)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/fib64.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAABBgFgAX4BfgMCAQAHBwEDZmliAAAKHwEdACAAQgJUBEAgAA8LIABCAn0QACAAQgF9EAB8Dws="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
