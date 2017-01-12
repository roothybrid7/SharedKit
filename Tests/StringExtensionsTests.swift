//
//  StringExtensionsTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/08.
//
//

import XCTest
@testable import SharedKit

class StringExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWhitespaceSeparated() {
        let sources = (
            empty: "",
            onlyWhitespace: " ",
            word: "test",
            wordWithExtraWhitespaces: " test  ",
            sentences: " This is a test"
        )
        var result = sources.empty.whitespaceSeparated()
        XCTAssertTrue(result.isEmpty)
        result = sources.onlyWhitespace.whitespaceSeparated()
        XCTAssertTrue(result.isEmpty)
        result = sources.word.whitespaceSeparated()
        XCTAssertEqual(result, "test")
        result = sources.wordWithExtraWhitespaces.whitespaceSeparated()
        XCTAssertEqual(result, "test")
        result = sources.sentences.whitespaceSeparated()
        XCTAssertEqual(result, "This is a test")
    }

    func testCamelized() {
        let sources = (
            empty: "",
            pascalcase: "ProjectInvite",
            camelcase: "projectInvite"
        )

        var result = sources.empty.camelized()
        XCTAssertTrue(result.isEmpty)
        result = sources.pascalcase.camelized()
        XCTAssertEqual(result, sources.camelcase)
        result = sources.camelcase.camelized()
        XCTAssertEqual(result, sources.camelcase)

        result = sources.empty.camelized(true)
        XCTAssertTrue(result.isEmpty)
        result = sources.pascalcase.camelized(true)
        XCTAssertEqual(result, sources.pascalcase)
        result = sources.camelcase.camelized(true)
        XCTAssertEqual(result, sources.pascalcase)
    }

    func testCamelToSnakecased() {
        let sources = (
            projectInvite: "ProjectInvite",
            screen: "screen"
        )
        var result = sources.projectInvite.camelToSnakecased()
        XCTAssertEqual(result, "project_invite")
        result = sources.projectInvite.camelToSnakecased(true)
        XCTAssertEqual(result, "PROJECT_INVITE")

        result = sources.screen.camelToSnakecased()
        XCTAssertEqual(result, "screen")
        result = sources.screen.camelToSnakecased(true)
        XCTAssertEqual(result, "SCREEN")
    }

    func testSnakeToCamelcased() {
        let sources = (
            projectInviteUpperred: "PROJECT_INVITE",
            projectInviteLowerred: "project_invite",
            screenUpperred: "SCREEN",
            screenLowerred: "screen"
        )

        var result = sources.projectInviteUpperred.snakeToCamelcased()
        XCTAssertEqual(result, "projectInvite")
        result = sources.projectInviteUpperred.snakeToCamelcased(true)
        XCTAssertEqual(result, "ProjectInvite")
        result = sources.projectInviteLowerred.snakeToCamelcased()
        XCTAssertEqual(result, "projectInvite")
        result = sources.projectInviteLowerred.snakeToCamelcased(true)
        XCTAssertEqual(result, "ProjectInvite")
        result = sources.screenUpperred.snakeToCamelcased()
        XCTAssertEqual(result, "screen")
        result = sources.screenUpperred.snakeToCamelcased(true)
        XCTAssertEqual(result, "Screen")
        result = sources.screenLowerred.snakeToCamelcased()
        XCTAssertEqual(result, "screen")
        result = sources.screenLowerred.snakeToCamelcased(true)
        XCTAssertEqual(result, "Screen")
    }
}
