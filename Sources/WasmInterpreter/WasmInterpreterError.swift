import Foundation

enum WasmInterpreterError: Error {
    case couldNotLoadEnvironment
    case couldNotLoadRuntime
    case couldNotLoadWasmBinary(String)
    case couldNotParseModule
    case couldNotLoadModule
    case couldNotFindFunction(String)
    case onCallFunction(String)
    case invalidFunctionReturnType
    case wasm3Error(String)
}
