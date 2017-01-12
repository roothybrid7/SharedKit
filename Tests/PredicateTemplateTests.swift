//
//  PredicateTemplateTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/08.
//
//

import XCTest
@testable import SharedKit

fileprivate class Target: NSObject {
    var name: String?
    var number: Int = 0

    init(name: String?, number: Int?) {
        self.name = name
        if let number = number {
            self.number = number
        }
    }
}

class PredicateTemplateTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    var targets: NSArray {
        let targets = [
            Target(name: nil, number: nil),
            Target(name: "foo", number: 1),
            Target(name: "bar", number: 2),
        ]
        return targets as NSArray
    }

    func testNull() {
        let pred = Predicate.null(for: "name")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertNotEqual(target.name, "foo")
        }
    }

    func testNotNull() {
        let pred = Predicate.notNull(for: "name")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 2)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, "foo")
        }
    }

    func testIn() {
        let values = ["bar", "buz"]
        let pred = Predicate.in(for: "name", valuesIn: values)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, values[0])
        }
    }

    func testNotIn() {
        let values = ["foo", "bar", "buz"]
        let pred = Predicate.notIn(for: "name", valuesIn: values)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, nil)
        }
    }

    func testEqual() {
        let pred = Predicate.equal(for: "name", to: "foo")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, "foo")
        }
    }

    func testNotEqual() {
        let pred = Predicate.notEqual(for: "name", to: "foo")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 2)
        if let target = result.last as? Target {
            XCTAssertEqual(target.name, "bar")
        }
    }

    func testBegins() {
        let pred = Predicate.begins(for: "name", with: "ba")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, "bar")
        }
    }

    func testEnds() {
        let pred = Predicate.ends(for: "name", with: "oo")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, "foo")
        }
    }

    func testContains() {
        let pred = Predicate.contains(for: "name", "o")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.name, "foo")
        }
    }

    func testNotContains() {
        let pred = Predicate.notContains(for: "name", "o")
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 2)
        if let target = result.last as? Target {
            XCTAssertEqual(target.name, "bar")
        }
    }

    func testGreaterThanOrEqual() {
        let pred = Predicate.greaterThanOrEqual(for: "number", to: 2)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.number, 2)
        }
    }

    func testLessThanOrEqual() {
        let pred = Predicate.lessThanOrEqual(for: "number", to: 0)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 1)
        if let target = result.first as? Target {
            XCTAssertEqual(target.number, 0)
        }
    }

    func testGreaterThan() {
        let pred = Predicate.greaterThan(for: "number", to: 2)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 0)
    }

    func testLessThan() {
        let pred = Predicate.lessThan(for: "number", to: 0)
        let result = targets.filtered(using: pred)
        XCTAssertEqual(result.count, 0)
    }

    func testSelfBegins() {
        let pred = Predicate.selfBegins(with: "b")
        let targets = ["foo", "bar", "buz"]
        let result = (targets as NSArray).filtered(using: pred)
        XCTAssertEqual(result.count, 2)
    }

    func testSelfEnds() {
        let pred = Predicate.selfEnds(with: "o")
        let targets = ["foo", "bar", "buz"]
        let result = (targets as NSArray).filtered(using: pred)
        XCTAssertEqual(result.count, 1)
    }

    func testSelfContains() {
        let pred = Predicate.selfContains("a")
        let targets = ["foo", "bar", "buz"]
        let result = (targets as NSArray).filtered(using: pred)
        XCTAssertEqual(result.count, 1)
    }
}
