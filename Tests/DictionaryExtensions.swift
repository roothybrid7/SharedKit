//
//  DictionaryExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/10.
//
//

import XCTest
@testable import SharedKit

class DictionaryExtensions: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFiltered() {
        let sources: [String: Any] = ["foo": 1, "bar": "hoge", "buz": true, "spam": NSObject()]
        let expecters = (
            foo: ["foo"],
            fooBuz: ["foo", "buz"],
            barSpam: ["bar", "spam"]
        )

        var results = filtered(forKeyValues: sources, by: expecters.foo)
        XCTAssertEqual(results.keys.map { $0 }, expecters.foo)
        results = filtered(forKeyValues: sources, by: expecters.fooBuz)
        XCTAssertEqual(results.keys.map { $0 }.sorted(), expecters.fooBuz.sorted())
        results = filtered(forKeyValues: sources, by: expecters.barSpam)
        XCTAssertEqual(results.keys.map { $0 }.sorted(), expecters.barSpam.sorted())
    }
}
