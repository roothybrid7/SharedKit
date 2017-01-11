import XCTest
@testable import SharedKit

class SharedKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SharedKit().text, "Hello, World!")
    }


    static var allTests : [(String, (SharedKitTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
