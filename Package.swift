// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "WasmInterpreter",
    products: [
        .library(
            name: "WasmInterpreter",
            targets: ["WasmInterpreter"]),
    ],
    dependencies: [
        .package(name: "CWasm3", url: "https://github.com/shareup/cwasm3.git", .upToNextMinor(from: "0.4.7"))
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: ["CWasm3"]),
        .testTarget(
            name: "WasmInterpreterTests",
            dependencies: ["WasmInterpreter"]),
    ]
)
