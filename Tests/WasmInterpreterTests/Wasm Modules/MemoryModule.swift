import Foundation
import WasmInterpreter

public struct MemoryModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: MemoryModule.wasm)
    }

    func string(at byteOffset: Int, length: Int) throws -> String {
        try _vm.stringFromHeap(byteOffset: byteOffset, length: length)
    }

    func integers(at byteOffset: Int, length: Int) throws -> [Int] {
        (try _vm.valuesFromHeap(byteOffset: byteOffset, length: length) as [Int32])
            .map(Int.init)
    }

    func asciiString(at byteOffset: Int, length: Int) throws -> String {
        String((try _vm.bytesFromHeap(byteOffset: byteOffset, length: length)
                    .map(UnicodeScalar.init)
                    .map(Character.init)))
    }

    func write(_ string: String, to byteOffset: Int) throws {
        try _vm.writeToHeap(string: string, byteOffset: byteOffset)
    }

    func write(_ integers: [Int], to byteOffset: Int) throws {
        try _vm.writeToHeap(values: integers.map(Int32.init), byteOffset: byteOffset)
    }

    func writeASCIICharacters(in string: String, to byteOffset: Int) throws {
        let bytes = string.compactMap { $0.asciiValue }

        enum _Error: Error {
            case invalidString(String)
        }

        guard string.count == bytes.count
        else { throw _Error.invalidString(string) }

        try _vm.writeToHeap(bytes: bytes, byteOffset: byteOffset)
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/memory.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 = "AGFzbQEAAAAFAwEAAQ=="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
