// swift-tools-version:5.2
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
            from: "0.4.7"),
        .package(
            name: "Synchronized",
            url: "https://github.com/shareup/synchronized.git",
            from: "2.3.0"),
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: [
                "CWasm3",
                .product(name: "SynchronizedDynamic", package: "Synchronized"),
            ]),
        .testTarget(
            name: "WasmInterpreterTests",
            dependencies: ["WasmInterpreter"]),
    ]
)
