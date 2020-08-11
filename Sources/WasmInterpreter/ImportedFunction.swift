import Foundation
import CWasm3

/// C function signature required for all native functions imported into a
/// WebAssembly module.
///
/// - Parameters:
///   - stackPointer: Stack pointer.
///   - heap: Pointer to the heap.
///
/// - Returns: Error description as a C string if an error occurs, otherwise `nil`
public typealias ImportedFunctionSignature =
    (UnsafeMutablePointer<UInt64>?, UnsafeMutableRawPointer?) -> UnsafeRawPointer?

public enum WasmType: Hashable {
    case int32
    case int64
    case float32
    case float64
}

public enum WasmValue: Hashable {
    case int32(Int32)
    case int64(Int64)
    case float32(Float32)
    case float64(Float64)
}

public struct ImportedFunction {

    /// Extracts the imported function's arguments of the specified types from the stack.
    ///
    /// - Throws: Throws if the stack pointer is `nil`.
    ///
    /// - Parameters:
    ///   - types: The expected argument types.
    ///   - stack: The stack pointer.
    ///
    /// - Returns: Array of the imported function's arguments.
    public static func arguments(
        withTypes types: [WasmType],
        from stack: UnsafeMutablePointer<UInt64>?
    ) throws -> [WasmValue] {
        guard let stack = UnsafeMutableRawPointer(stack) else { throw WasmInterpreterError.invalidStackPointer }

        var values = [WasmValue]()
        for (index, type) in types.enumerated() {
            switch type {
            case .int32:
                let value = stack.load(
                    fromByteOffset: index * MemoryLayout<Int64>.stride,
                    as: Int32.self
                )
                values.append(WasmValue.int32(value))
            case .int64:
                let value = stack.load(
                    fromByteOffset: index * MemoryLayout<Int64>.stride,
                    as: Int64.self
                )
                values.append(WasmValue.int64(value))
            case .float32:
                let value = stack.load(
                    fromByteOffset: index * MemoryLayout<Int64>.stride,
                    as: Float32.self
                )
                values.append(WasmValue.float32(value))
            case .float64:
                let value = stack.load(
                    fromByteOffset: index * MemoryLayout<Int64>.stride,
                    as: Float64.self
                )
                values.append(WasmValue.float64(value))
            }
        }

        return values
    }

    /// Places the specified return value on the specified stack.
    ///
    /// - Throws: Throws if the stack pointer is `nil`.
    ///
    /// - Parameters:
    ///   - ret: The value to return from the imported function.
    ///   - stack: The stack pointer.
    public static func pushReturnValue(_ ret: WasmValue, to stack: UnsafeMutablePointer<UInt64>?) throws {
        guard let stack = UnsafeMutableRawPointer(stack) else { throw WasmInterpreterError.invalidStackPointer }

        switch ret {
        case .int32(let value):
            stack.storeBytes(of: value, as: Int32.self)
        case .int64(let value):
            stack.storeBytes(of: value, as: Int64.self)
        case .float32(let value):
            stack.storeBytes(of: value, as: Float32.self)
        case .float64(let value):
            stack.storeBytes(of: value, as: Float64.self)
        }
    }
}

public let importedFunctionInternalError = UnsafeRawPointer(UnsafeMutableRawPointer.allocate(
    byteCount: _importedFunctionInternalError.count, alignment: MemoryLayout<CChar>.alignment
))
private let _importedFunctionInternalError = "ImportedFunctionInternalError".utf8CString
