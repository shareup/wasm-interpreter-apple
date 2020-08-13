import XCTest
@testable import WasmInterpreter

final class StringWasmTypeProtocolTests: XCTestCase {
    func testConversionFromInt32() throws {
        XCTAssertEqual("0", try String(wasmType: Int32(0)))
        XCTAssertEqual("1", try String(wasmType: Int32(1)))
        XCTAssertEqual("-1", try String(wasmType: Int32(-1)))
        XCTAssertEqual("198273", try String(wasmType: Int32(198273)))
        XCTAssertEqual("-198273", try String(wasmType: Int32(-198273)))
        XCTAssertEqual("0", try String(wasmType: Int32.zero))
        XCTAssertEqual("-2147483648", try String(wasmType: Int32.min))
        XCTAssertEqual("2147483647", try String(wasmType: Int32.max))
    }

    func testConversionFromInt64() throws {
        XCTAssertEqual("0", try String(wasmType: Int64(0)))
        XCTAssertEqual("1", try String(wasmType: Int64(1)))
        XCTAssertEqual("-1", try String(wasmType: Int64(-1)))
        XCTAssertEqual("198273", try String(wasmType: Int64(198273)))
        XCTAssertEqual("-198273", try String(wasmType: Int64(-198273)))
        XCTAssertEqual("0", try String(wasmType: Int64.zero))
        XCTAssertEqual("-9223372036854775808", try String(wasmType: Int64.min))
        XCTAssertEqual("9223372036854775807", try String(wasmType: Int64.max))
    }

    func testConversionFromFloat32() throws {
        XCTAssertEqual("0.0", try String(wasmType: Float32(0)))
        XCTAssertEqual("1.0", try String(wasmType: Float32(1)))
        XCTAssertEqual("-1.0", try String(wasmType: Float32(-1)))
        XCTAssertEqual("198273.55", try String(wasmType: Float32(198273.543789)))
        XCTAssertEqual("-198273.55", try String(wasmType: Float32(-198273.543789)))
        XCTAssertEqual("0.0", try String(wasmType: Float32.zero))
        XCTAssertEqual("9999.998", try String(wasmType: Float32(9999.998)))
        XCTAssertEqual("-9999.998", try String(wasmType: Float32(-9999.998)))
    }

    func testConversionFromFloat64() throws {
        XCTAssertEqual("0.0", try String(wasmType: Float64(0)))
        XCTAssertEqual("1.0", try String(wasmType: Float64(1)))
        XCTAssertEqual("-1.0", try String(wasmType: Float64(-1)))
        XCTAssertEqual("198273.543789", try String(wasmType: Float64(198273.543789)))
        XCTAssertEqual("-198273.543789", try String(wasmType: Float64(-198273.543789)))
        XCTAssertEqual("0.0", try String(wasmType: Float64.zero))
        XCTAssertEqual("999999.9999999998", try String(wasmType: Float64(999999.9999999998)))
        XCTAssertEqual("-999999.9999999998", try String(wasmType: Float64(-999999.9999999998)))
    }

    static var allTests = [
        ("testConversionFromInt32", testConversionFromInt32),
        ("testConversionFromInt64", testConversionFromInt64),
        ("testConversionFromFloat32", testConversionFromFloat32),
        ("testConversionFromFloat64", testConversionFromFloat64),
    ]
}

