//
//  URLExtensionsTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/20.
//
//

import XCTest
import Foundation
@testable import SharedKit

class URLExtensionsTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    let targets = [
        (url: URL(string: "https://example.com:3000/users/sign_in?user=hoge#link1")!, expect: "https://example.com:3000"),
        (url: URL(string: "https://user:pass@example.com:3000/users/sign_in?user=hoge#link2")!, expect: "https://user:pass@example.com:3000"),
        (url: URL(fileURLWithPath: "/foo/bar/buz.png"), expect: "file://")
    ]

    func testURL() {
        for target in targets {
            let result = target.url.origin
            XCTAssertNotNil(result)
            XCTAssertEqual(result!, target.expect)
        }
    }

    func testURLComponents() {
        for target in targets {
            let comps = URLComponents(url: target.url, resolvingAgainstBaseURL: false)!
            let result = comps.origin
            XCTAssertNotNil(result)
            XCTAssertEqual(result!, target.expect)
        }
    }
}
