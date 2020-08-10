import XCTest

import WasmInterpreterTests

var tests = [XCTestCaseEntry]()
tests += WasmInterpreterTests.allTests()
XCTMain(tests)
