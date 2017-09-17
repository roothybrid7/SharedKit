//
//  InfoPlistAccessibleTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/20.
//
//

import XCTest
import UIKit
@testable import SharedKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable force_cast

class InfoPlistAccessibleTests: XCTestCase {

    var bundle = Bundle(for: InfoPlistAccessibleTests.self)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testUserActivityTypes() {
        let result = bundle.userActivityTypes
        XCTAssertNotNil(result)
    }

    func testExecutable() {
        let result = bundle.executable!
        XCTAssertEqual(result, "SharedKitTests")
    }

    func testAppVersion() {
        let result = bundle.appVersion
        XCTAssertEqual(result, "1.0", "CFBundleShortVersionString")
    }

    func testBuild() {
        let result = bundle.appBuild
        XCTAssertEqual(result, "1")
    }

    func testAppIdentifierPrefix() {
        let result = bundle.appIdentifierPrefix
        XCTAssertNil(result)
    }

    func testConfigurationName() {
        let result = bundle.configurationName
        XCTAssertNil(result)
    }

    func testPackageType() {
        let result = bundle.packageType
        XCTAssertEqual(result, "BNDL")
    }

    func testBoolType() {
        let typedKey: KeyBoolType = "TestBoolValue"
        var result = bundle.bool(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertTrue(result, bundle.infoDictionary!.description)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertTrue(result, bundle.infoDictionary!.description)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(String(describing: rawResult), "1")
    }

    func testIntType() {
        let typedKey: KeyIntType = "TestIntValue"
        let expected = 2
        var result = bundle.int(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertEqual(result, expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(result, expected)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(String(describing: rawResult), String(describing: expected))
    }

    func testFloatType() {
        let typedKey: KeyFloatType = "TestDecimalValue"
        let expected: Float = 0.25
        var result = bundle.float(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertEqual(result, expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(result, expected)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(String(describing: rawResult), String(describing: expected))
    }

    func testDoubleType() {
        let typedKey: KeyDoubleType = "TestDecimalValue"
        let expected: Double = 0.25
        var result = bundle.double(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertEqual(result, expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(result, expected)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(String(describing: rawResult), String(describing: expected))
    }

    func testStringTypeEmpty() {
        let typedKey: KeyStringType = "TestEmpty"
        XCTAssertNil(bundle.object(forInfoDictionaryKey: typedKey.rawValue))
        XCTAssertNil(bundle.string(forInfoDictionaryKey: typedKey.rawValue))
        XCTAssertTrue(bundle.objectTyped(forInfoTypedKey: typedKey).isEmpty)
    }

    func testStringType() {
        let typedKey: KeyStringType = "TestStringValue"
        let expected = "BundleTests"
        var result = bundle.string(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertEqual(result, expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(result, expected)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(rawResult as! String, expected)
    }

    func testStringsTypeEmpty() {
        let typedKey: KeyStringsType = "TestEmpty"
        XCTAssertNil(bundle.object(forInfoDictionaryKey: typedKey.rawValue))
        XCTAssertTrue(bundle.strings(forInfoDictionaryKey: typedKey.rawValue).isEmpty)
        XCTAssertTrue(bundle.objectTyped(forInfoTypedKey: typedKey).isEmpty)
        XCTAssertEqual(bundle.objectTyped(forInfoTypedKey: typedKey), [])
    }

    func testStringsType() {
        let typedKey: KeyStringsType = "TestStringsValue"
        let expected = ["str1", "str2"]
        var result = bundle.strings(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertEqual(result, expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(result, expected)

        let rawResult = bundle.object(forInfoDictionaryKey: typedKey.rawValue)!
        XCTAssertEqual(rawResult as! [String], expected)
    }

    func testArrayTypeEmpty() {
        let typedKey = KeyValueType<[Int]>(rawValue: "TestEmpty")!
        XCTAssertTrue(bundle.array(forInfoDictionaryKey: typedKey.rawValue).isEmpty)
        XCTAssertTrue(bundle.objectTyped(forInfoTypedKey: typedKey).isEmpty)
    }

    func testArrayIntType() {
        let typedKey = KeyValueType<[Int]>(rawValue: "TestArrayIntValues")!
        let expected = [1, 2]
        let result = bundle.array(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertFalse(result.isEmpty)
        XCTAssertEqual(result as! [Int], expected)

        var typedResult: [Int] = bundle.typedArray(forInfoDictionary: typedKey.rawValue)
        XCTAssertFalse(typedResult.isEmpty)
        XCTAssertEqual(typedResult, expected)

        typedResult = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertEqual(typedResult, expected)
    }

    func testArrayAnyType() {
        let typedKey = KeyValueType<[Any]>(rawValue: "TestArrayAnyValues")!
        let expected: [Any] = ["str", 2, true, 4.4]

        var result = bundle.array(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertFalse(result.isEmpty)
        assertAnyValue(result, expected: expected)

        result = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertFalse(result.isEmpty)
        assertAnyValue(result, expected: expected)
    }

    func testDictinoaryEmpty() {
        let typedKey = KeyValueType<[String: Int]>(rawValue: "TestEmpty")!
        XCTAssertNil(bundle.dictionary(forInfoDictionaryKey: typedKey.rawValue))
        XCTAssertTrue(bundle.objectTyped(forInfoTypedKey: typedKey).isEmpty)
        let typedResult: [String: Int]? = bundle.typedDictionary(forInfoDictionary: typedKey.rawValue)
        XCTAssertNil(typedResult)
    }

    func testDictionaryIntType() {
        let typedKey = KeyValueType<[String: Int]>(rawValue: "TestDictionaryIntValue")!
        let expected = ["first": 1, "second": 2]
        let result = bundle.dictionary(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertNotNil(result)
        XCTAssertEqual(result as! [String: Int], expected)

        var typedResult: [String: Int] = bundle.typedDictionary(forInfoDictionary: typedKey.rawValue)!
        XCTAssertFalse(typedResult.isEmpty)
        XCTAssertEqual(typedResult, expected)

        typedResult = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertFalse(typedResult.isEmpty)
        XCTAssertEqual(typedResult, expected)
    }

    func testDictionaryAnyType() {
        let typedKey = KeyValueType<[String: Any]>(rawValue: "TestDictionaryAnyValue")!
        let expected: [String: Any] = ["first": "one", "second": 2, "third": true, "forth": 4.4]

        let result = bundle.dictionary(forInfoDictionaryKey: typedKey.rawValue)
        XCTAssertNotNil(result)
        assertAnyKeyValues(result!, expected: expected)

        var typedResult = bundle.objectTyped(forInfoTypedKey: typedKey)
        XCTAssertFalse(typedResult.isEmpty)
        assertAnyKeyValues(typedResult, expected: expected)

        typedResult = bundle.typedDictionary(forInfoDictionary: typedKey.rawValue)!
        XCTAssertFalse(typedResult.isEmpty)
        assertAnyKeyValues(typedResult, expected: expected)
    }
}
