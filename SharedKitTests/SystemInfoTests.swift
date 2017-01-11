//
//  SystemInfoTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/28.
//
//

import XCTest
import UIKit
@testable import SharedKit

class SystemInfoTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testModel() {
        XCTAssertNotEqual(SystemInfo.systemInfo.model, "Unknown")
    }

    func testOSName() {
        XCTAssertEqual(SystemInfo.systemInfo.osName, "iOS")
    }

    func testOSVersion() {
        let result = SystemInfo.systemInfo.osVersion
        let osVersion = ProcessInfo.processInfo.operatingSystemVersion
        let versionString = "\(osVersion.majorVersion).\(osVersion.minorVersion).\(osVersion.patchVersion)"
        XCTAssertTrue(versionString.hasPrefix(result))
        XCTAssertGreaterThanOrEqual(versionString.characters.count, result.characters.count)
    }
}
