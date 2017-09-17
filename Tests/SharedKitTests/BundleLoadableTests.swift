//
//  BundleLoadableTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/14.
//
//

import XCTest
import UIKit
@testable import SharedKit

private class BundleView: UIView, BundleLoadable {
}

class BundleLoadableTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testOwnedNib() {
        let nib = BundleView.ownedNib
        XCTAssertNotNil(nib)
    }
}
