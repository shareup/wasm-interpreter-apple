import Foundation
import WasmInterpreter

public struct MemoryModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: MemoryModule.wasm)
    }

    func string(at offset: Int, length: Int) throws -> String {
        try _vm.stringFromHeap(offset: offset, length: length)
    }

    func integers(at offset: Int, length: Int) throws -> [Int] {
        (try _vm.valuesFromHeap(offset: offset, length: length) as [Int32])
            .map(Int.init)
    }

    func write(_ string: String, to offset: Int) throws {
        try _vm.writeToHeap(string: string, offset: offset)
    }

    func write(_ integers: [Int], to offset: Int) throws {
        try _vm.writeToHeap(values: integers.map(Int32.init), offset: offset)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/memory.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAAFAwEAAQ=="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
