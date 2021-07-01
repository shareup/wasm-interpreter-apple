import Foundation

extension WasmInterpreter {
    public func call(_ name: String) throws {
        try _call(try function(named: name), args: [])
    }

    public func call<Ret>(_ name: String) throws -> Ret where Ret: WasmTypeProtocol {
        return try _call(try function(named: name), args: [])
    }

    public func call<Arg1>(_ name: String, _ arg1: Arg1) throws where Arg1: WasmTypeProtocol {
        try _call(try function(named: name), args: [try String(wasmType: arg1)])
    }

    public func call<Arg1, Ret>(
        _ name: String, _ arg1: Arg1
    ) throws -> Ret where Arg1: WasmTypeProtocol, Ret: WasmTypeProtocol {
        return try _call(try function(named: name), args: [try String(wasmType: arg1)])
    }

    public func call<Arg1, Arg2>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol {
        try _call(try function(named: name), args: [try String(wasmType: arg1), try String(wasmType: arg2)])
    }

    public func call<Arg1, Arg2, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2
    ) throws -> Ret where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Ret: WasmTypeProtocol {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2)]
        )
    }

    public func call<Arg1, Arg2, Arg3>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3
    ) throws where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3)])
    }

    public func call<Arg1, Arg2, Arg3, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Ret: WasmTypeProtocol {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3)])
    }

    public func call<Arg1, Arg2, Arg3, Arg4>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4
    ) throws
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Arg4: WasmTypeProtocol {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2),
                   try String(wasmType: arg3), try String(wasmType: arg4)]
        )
    }

    public func call<Arg1, Arg2, Arg3, Arg4, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2),
                   try String(wasmType: arg3), try String(wasmType: arg4)]
        )
    }

    public func call<Arg1, Arg2, Arg3, Arg4, Arg5>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5
    ) throws
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5)]
        )
    }

    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5)]
        )
    }

    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6
    ) throws
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6)]
        )
    }

    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol, Arg4: WasmTypeProtocol,
            Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6)]
        )
    }
    
    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7
    ) throws
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol,
            Arg7: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6),
                   try String(wasmType: arg7)]
        )
    }
    
    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol,
            Arg7: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6),
                   try String(wasmType: arg7)]
        )
    }
    
    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8
    ) throws
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol,
            Arg7: WasmTypeProtocol, Arg8: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6),
                   try String(wasmType: arg7), try String(wasmType: arg8)]
        )
    }
    
    public func call<Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Ret>(
        _ name: String, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3,
        _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8
    ) throws -> Ret
      where Arg1: WasmTypeProtocol, Arg2: WasmTypeProtocol, Arg3: WasmTypeProtocol,
            Arg4: WasmTypeProtocol, Arg5: WasmTypeProtocol, Arg6: WasmTypeProtocol,
            Arg7: WasmTypeProtocol, Arg8: WasmTypeProtocol, Ret: WasmTypeProtocol
    {
        return try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2), try String(wasmType: arg3),
                   try String(wasmType: arg4), try String(wasmType: arg5), try String(wasmType: arg6),
                   try String(wasmType: arg7), try String(wasmType: arg8)]
        )
    }
}
