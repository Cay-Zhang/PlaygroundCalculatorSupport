import XCTest
@testable import PlaygroundCalculatorSupport

final class PlaygroundCalculatorSupportTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(PlaygroundCalculatorSupport().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
