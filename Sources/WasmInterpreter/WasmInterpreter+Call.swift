import Foundation

public extension WasmInterpreter {
    func call(_ name: String) throws {
        try _call(try function(named: name), args: [])
    }

    func call<Ret>(_ name: String) throws -> Ret where Ret: WasmTypeProtocol {
        try _call(try function(named: name), args: [])
    }

    func call(_ name: String, _ arg1: some WasmTypeProtocol) throws {
        try _call(try function(named: name), args: [try String(wasmType: arg1)])
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol
    ) throws -> Ret where Ret: WasmTypeProtocol {
        try _call(try function(named: name), args: [try String(wasmType: arg1)])
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2)]
        )
    }

    func call<Ret>(
        _ name: String,
        _ arg1: some WasmTypeProtocol,
        _ arg2: some WasmTypeProtocol
    ) throws -> Ret where Ret: WasmTypeProtocol {
        try _call(
            try function(named: name),
            args: [try String(wasmType: arg1), try String(wasmType: arg2)]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
            ]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol, _ arg4: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol, _ arg4: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
            ]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol, _ arg4: some WasmTypeProtocol,
        _ arg5: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol, _ arg4: some WasmTypeProtocol,
        _ arg5: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
            ]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
            ]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol, _ arg7: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
                try String(wasmType: arg7),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol, _ arg7: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
                try String(wasmType: arg7),
            ]
        )
    }

    func call(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol, _ arg7: some WasmTypeProtocol,
        _ arg8: some WasmTypeProtocol
    ) throws {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
                try String(wasmType: arg7),
                try String(wasmType: arg8),
            ]
        )
    }

    func call<Ret>(
        _ name: String, _ arg1: some WasmTypeProtocol, _ arg2: some WasmTypeProtocol,
        _ arg3: some WasmTypeProtocol,
        _ arg4: some WasmTypeProtocol, _ arg5: some WasmTypeProtocol,
        _ arg6: some WasmTypeProtocol, _ arg7: some WasmTypeProtocol,
        _ arg8: some WasmTypeProtocol
    ) throws -> Ret
        where Ret: WasmTypeProtocol
    {
        try _call(
            try function(named: name),
            args: [
                try String(wasmType: arg1),
                try String(wasmType: arg2),
                try String(wasmType: arg3),
                try String(wasmType: arg4),
                try String(wasmType: arg5),
                try String(wasmType: arg6),
                try String(wasmType: arg7),
                try String(wasmType: arg8),
            ]
        )
    }
}
