import Foundation
import WasmInterpreter

public struct MemoryModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: MemoryModule.wasm)
        try _vm.addImportHandler(named: "write", namespace: "native", block: self.write)
    }

    func callWrite() throws -> String {
        try _vm.call("write_utf8") as ()
        return try _vm.stringFromHeap(offset: 0, length: 13) // offset and length hardcoded in memory.wasm
    }

    func callModify() throws -> String {
        try _vm.call("modify_utf8", Int32(6))
        return try _vm.stringFromHeap(offset: 0, length: 13) // offset and length hardcoded in memory.wasm
    }

    private var write: (Int32, Int32, UnsafeMutableRawPointer?) -> Void {
        return { (offset: Int32, length: Int32, heap: UnsafeMutableRawPointer?) -> Void in
            heap?
                .advanced(by: Int(offset))
                .initializeMemory(as: CChar.self, repeating: CChar(bitPattern: 0x0041), count: Int(length))
        }
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/memory.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 =
            "AGFzbQEAAAABDQNgAn9/AGAAAGABfwACEAEGbmF0aXZlBXdyaXRlAAADAwIBAgUDAQABBxwCCndyaXRlX3V0ZjgAAQttb2RpZnlfdXRmOAACChoCCABBAEENEAALDwAgACAAKAIAQQFqNgIACw=="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
