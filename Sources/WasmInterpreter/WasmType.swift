import Foundation

public protocol WasmTypeProtocol {}

extension Int32: WasmTypeProtocol {}
extension Int64: WasmTypeProtocol {}
extension Float32: WasmTypeProtocol {}
extension Float64: WasmTypeProtocol {}

func isValidWasmType<T: WasmTypeProtocol>(_: T.Type) -> Bool {
    Int32.self == T.self || Int64.self == T.self ||
        Float32.self == T.self || Float64.self == T.self
}

enum WasmType: Hashable {
    case int32
    case int64
    case float32
    case float64
}

enum WasmValue: Hashable {
    case int32(Int32)
    case int64(Int64)
    case float32(Float32)
    case float64(Float64)
}
