import XCTest

#if !canImport(ObjectiveC)
    public func allTests() -> [XCTestCaseEntry] {
        [
            testCase(WasmInterpreterTests.allTests),
        ]
    }
#endif
