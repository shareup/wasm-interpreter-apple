import Foundation
import WasmInterpreter

public struct MemoryModule {
    private let _vm: WasmInterpreter

    init() throws {
        _vm = try WasmInterpreter(module: MemoryModule.wasm)
        try _vm.importNativeFunction(
            named: "write",
            namespace: "native",
            signature: "v(i i)",
            nativeFunction: write
        )
    }

    func callWrite() throws -> String {
        try _vm.call("write_utf8", args: []) as ()
        return try _vm.stringFromHeap(offset: 0, length: 13) // offset and length hardcoded in memory.wasm
    }

    func callModify() throws -> String {
        try _vm.call("modify_utf8", args: ["6"]) as ()
        return try _vm.stringFromHeap(offset: 0, length: 13) // offset and length hardcoded in memory.wasm
    }

    private var write: ImportedFunctionSignature {
        return { (stack: UnsafeMutablePointer<UInt64>?, heap: UnsafeMutableRawPointer?) -> UnsafeRawPointer? in
            do {
                let args = try ImportedFunction.arguments(withTypes: [.int32, .int32], from: stack)
                guard case .int32(let offset) = args[0], case .int32(let length) = args[1] else {
                    throw WasmInterpreterError.incorrectArguments(args)
                }
                guard let heap = heap else { throw WasmInterpreterError.missingHeap }

                heap
                    .advanced(by: Int(offset))
                    .initializeMemory(as: CChar.self, repeating: CChar(bitPattern: 0x0041), count: Int(length))
                return nil
            } catch {
                return importedFunctionInternalError
            }
        }
    }

    // `wat2wasm -o >(base64) Tests/WasmInterpreterTests/Resources/memory.wat | pbcopy`
    private static var wasm: [UInt8] {
        let base64 =
            "AGFzbQEAAAABDQNgAn9/AGAAAGABfwACEAEGbmF0aXZlBXdyaXRlAAADAwIBAgUDAQABBxwCCndyaXRlX3V0ZjgAAQttb2RpZnlfdXRmOAACChoCCABBAEENEAALDwAgACAAKAIAQQFqNgIACw=="
        return Array<UInt8>(Data(base64Encoded: base64)!)
    }
}
