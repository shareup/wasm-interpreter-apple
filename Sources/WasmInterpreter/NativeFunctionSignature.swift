import Foundation

func signature() throws -> String { "v()" }

func signature(
    arg1: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self)
    signature += ")"
    return signature
}

func signature(
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type,
    arg7: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self) + " "
    signature += try signatureIdentifier(for: arg7.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type,
    arg7: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self) + " "
    signature += try signatureIdentifier(for: arg7.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type,
    arg7: (some WasmTypeProtocol).Type,
    arg8: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self) + " "
    signature += try signatureIdentifier(for: arg7.self) + " "
    signature += try signatureIdentifier(for: arg8.self)
    signature += ")"
    return signature
}

func signature(
    arg1: (some WasmTypeProtocol).Type,
    arg2: (some WasmTypeProtocol).Type,
    arg3: (some WasmTypeProtocol).Type,
    arg4: (some WasmTypeProtocol).Type,
    arg5: (some WasmTypeProtocol).Type,
    arg6: (some WasmTypeProtocol).Type,
    arg7: (some WasmTypeProtocol).Type,
    arg8: (some WasmTypeProtocol).Type,
    ret: (some WasmTypeProtocol).Type
) throws -> String {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self) + " "
    signature += try signatureIdentifier(for: arg5.self) + " "
    signature += try signatureIdentifier(for: arg6.self) + " "
    signature += try signatureIdentifier(for: arg7.self) + " "
    signature += try signatureIdentifier(for: arg8.self)
    signature += ")"
    return signature
}

func signatureIdentifier<T: WasmTypeProtocol>(for _: T.Type) throws -> String {
    if Int32.self == T.self { return "i" }
    else if Int64.self == T.self { return "I" }
    else if Float32.self == T.self { return "f" }
    else if Float64.self == T.self { return "F" }
    else { throw WasmInterpreterError.unsupportedWasmType(String(describing: T.self)) }
}
