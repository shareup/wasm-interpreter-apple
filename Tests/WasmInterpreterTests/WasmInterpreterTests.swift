import XCTest
@testable import WasmInterpreter

final class WasmInterpreterTests: XCTestCase {
    func testCallingTwoFunctionsWithSameImplementation() throws {
        let mod = try ConstantModule()
        XCTAssertEqual(65536, try mod.constant1())
        XCTAssertEqual(65536, try mod.constant2())
    }

    func testPassingAndReturning32BitValues() throws {
        let mod = try AddModule()
        XCTAssertEqual(0, try mod.add(-1, 1))
        XCTAssertEqual(0, try mod.add(0, 0))
        XCTAssertEqual(3, try mod.add(1, 2))
        XCTAssertEqual(910861, try mod.add(13425, 897436))
    }

    func testPassingAndReturning64BitValues() throws {
        let mod = try FibonacciModule()
        XCTAssertEqual(0, try mod.calculateValue(at: 0))
        XCTAssertEqual(1, try mod.calculateValue(at: 1))
        XCTAssertEqual(1, try mod.calculateValue(at: 2))
        XCTAssertEqual(5, try mod.calculateValue(at: 5))
        XCTAssertEqual(75025, try mod.calculateValue(at: 25))
    }

    func testUsingImportedFunction() throws {
        let mod = try ImportedAddModule()
        XCTAssertEqual(-3291, try mod.askModuleToCallImportedFunction())
    }

    func testAccessingAndModifyingHeapMemory() throws {
        let mod = try MemoryModule()
        try XCTAssertEqual("AAAAAAAAAAAAA", mod.callWrite())
        try XCTAssertEqual("AAAAAABAAAAAA", mod.callModify())
    }

    static var allTests = [
        ("testCallingTwoFunctionsWithSameImplementation", testCallingTwoFunctionsWithSameImplementation),
        ("testPassingAndReturning32BitValues", testPassingAndReturning32BitValues),
        ("testPassingAndReturning64BitValues", testPassingAndReturning64BitValues),
        ("testUsingImportedFunction", testUsingImportedFunction),
        ("testAccessingAndModifyingHeapMemory", testAccessingAndModifyingHeapMemory),
    ]
}
