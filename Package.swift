// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "WasmInterpreter",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v5),
    ],
    products: [
        .library(
            name: "WasmInterpreter",
            targets: ["WasmInterpreter"]),
    ],
    dependencies: [
        .package(
            name: "CWasm3",
            url: "https://github.com/shareup/cwasm3.git",
            from: "0.5.0"),
        .package(
            name: "Synchronized",
            url: "https://github.com/shareup/synchronized.git",
            from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: ["CWasm3", "Synchronized"],
            cSettings: [.define("APPLICATION_EXTENSION_API_ONLY", to: "YES")]),
        .testTarget(
            name: "WasmInterpreterTests",
            dependencies: ["WasmInterpreter"],
            exclude: [
                "Resources/constant.wat",
                "Resources/memory.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/add.wat"]),
    ]
)
