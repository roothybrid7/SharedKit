//
//  NavigationBarExtendableTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/23.
//
//

import XCTest
import UIKit
@testable import SharedKit

class NavigationBarExtendableTests: XCTestCase {

    var navBar: UINavigationBar?

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        navBar = UINavigationBar()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testHideHairline() {
        let navBar = self.navBar!
        XCTAssertFalse(navBar.isHairlineHidden)
        navBar.hideHairline(with: UIColor.blue)
        XCTAssertTrue(navBar.isHairlineHidden)
    }

    func testClearHairline() {
        let navBar = self.navBar!
        XCTAssertFalse(navBar.isHairlineHidden)
        navBar.hideHairline(with: UIColor.blue)
        XCTAssertTrue(navBar.isHairlineHidden)
        navBar.clearHairline()
        XCTAssertFalse(navBar.isHairlineHidden)
    }
}
