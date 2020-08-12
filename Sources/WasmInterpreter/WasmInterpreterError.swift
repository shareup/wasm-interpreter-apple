import Foundation

public enum WasmInterpreterError: Error {
    case couldNotLoadEnvironment
    case couldNotLoadRuntime
    case couldNotLoadWasmBinary(String)
    case couldNotParseModule
    case couldNotLoadModule
    case couldNotFindFunction(String)
    case onCallFunction(String)
    case invalidFunctionReturnType
    case invalidStackPointer
    case invalidMemoryAccess
    case invalidUTF8String
    case couldNotGenerateFunctionContext
    case incorrectArguments([WasmValue])
    case missingHeap
    case wasm3Error(String)
}
