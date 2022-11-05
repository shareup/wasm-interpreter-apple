// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "WasmInterpreter",
    platforms: [
        .macOS(.v11), .iOS(.v14),
    ],
    products: [
        .library(
            name: "WasmInterpreter",
            targets: ["WasmInterpreter"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/shareup/synchronized.git",
            from: "4.0.0"
        ),
    ],
    targets: [
        .target(
            name: "WasmInterpreter",
            dependencies: [
                "CWasm3",
                .product(name: "Synchronized", package: "synchronized")
            ],
            cSettings: [
                .define("APPLICATION_EXTENSION_API_ONLY", to: "YES"),
            ]
        ),
        .binaryTarget(
            name: "CWasm3",
            url: "https://github.com/shareup/cwasm3/releases/download/v0.5.2/CWasm3-0.5.0.xcframework.zip",
            checksum: "a2b0785be1221767d926cee76b087f168384ec9735b4f46daf26e12fae2109a3"
        ),
        .testTarget(
            name: "WasmInterpreterTests",
            dependencies: ["WasmInterpreter"],
            exclude: [
                "Resources/constant.wat",
                "Resources/memory.wat",
                "Resources/fib64.wat",
                "Resources/imported-add.wat",
                "Resources/add.wat",
            ]
        ),
    ]
)
