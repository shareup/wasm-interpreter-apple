import Foundation

func signature() throws -> String { "v()" }

func signature<Arg1>(
    arg1: Arg1.Type
) throws -> String where Arg1: WasmTypeProtocol {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self)
    signature += ")"
    return signature
}

func signature<Ret>(
    ret: Ret.Type
) throws -> String where Ret: WasmTypeProtocol {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += ")"
    return signature
}

func signature<Arg1, Ret>(
    arg1: Arg1.Type,
    ret: Ret.Type
) throws -> String where Arg1: WasmTypeProtocol, Ret: WasmTypeProtocol {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2>(
    arg1: Arg1.Type,
    arg2: Arg2.Type
) throws -> String where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol {
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    ret: Ret.Type
) throws -> String where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Ret: WasmTypeProtocol {
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2, Arg3>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol
{
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2, Arg3, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Ret: WasmTypeProtocol
{
    var signature = ""
    signature += try signatureIdentifier(for: ret.self)
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2, Arg3, Arg4>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol
{
    var signature = "v"
    signature += "("
    signature += try signatureIdentifier(for: arg1.self) + " "
    signature += try signatureIdentifier(for: arg2.self) + " "
    signature += try signatureIdentifier(for: arg3.self) + " "
    signature += try signatureIdentifier(for: arg4.self)
    signature += ")"
    return signature
}

func signature<Arg1, Arg2, Arg3, Arg4, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol,
    Arg3: WasmTypeProtocol, Arg4: WasmTypeProtocol, Ret: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Ret: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol,
    Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Ret: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type,
    arg7: Arg7.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol,
    Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Arg7: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type,
    arg7: Arg7.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol,
    Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Arg7: WasmTypeProtocol,
    Ret: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type,
    arg7: Arg7.Type,
    arg8: Arg8.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol,
    Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Arg7: WasmTypeProtocol,
    Arg8: WasmTypeProtocol
{
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

func signature<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Ret>(
    arg1: Arg1.Type,
    arg2: Arg2.Type,
    arg3: Arg3.Type,
    arg4: Arg4.Type,
    arg5: Arg5.Type,
    arg6: Arg6.Type,
    arg7: Arg7.Type,
    arg8: Arg8.Type,
    ret: Ret.Type
) throws -> String
    where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
    Arg4: WasmTypeProtocol,
    Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Arg7: WasmTypeProtocol,
    Arg8: WasmTypeProtocol, Ret: WasmTypeProtocol
{
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
