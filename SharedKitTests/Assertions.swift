//
//  Assertions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/03.
//
//

import Foundation
import XCTest

/**
    Assertion of an array of Any that actual type is a primitive type.

    - todo: Supports a custom class, struct, enum
 */
func assertAnyValue(_ value: [Any], expected: [Any]) {
    for (val, exp) in zip(value, expected) {
        switch (val, exp) {
        case let (castedVal as Bool, castedExp as Bool):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as Int, castedExp as Int):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as Double, castedExp as Double):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as String, castedExp as String):
            XCTAssertEqual(castedVal, castedExp)
        default:
            XCTFail("Invalid type: \(val): \(type(of: val)) should be \(exp): \(type(of: exp))")
        }
    }
}

func assertAnyKeyValues<T: Hashable>(_ value: [T: Any], expected: [T: Any]) {
    guard value.count == expected.count else {
        XCTFail("Invalid assertion value count \(value.count) or expected count \(expected.count)")
        return
    }

    for key in value.keys {
        let (val, exp) = (value[key], expected[key])
        switch (val, exp) {
        case let (castedVal as Bool, castedExp as Bool):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as Int, castedExp as Int):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as Double, castedExp as Double):
            XCTAssertEqual(castedVal, castedExp)
        case let (castedVal as String, castedExp as String):
            XCTAssertEqual(castedVal, castedExp)
        default:
            XCTFail("Invalid type: \(val): \(type(of: val)) should be \(exp): \(type(of: exp))")
        }
    }
}
