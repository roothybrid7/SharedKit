//
//  ViewConstraintableTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/08/25.
//
//

import XCTest
import UIKit
@testable import SharedKit

extension UIView: ViewConstraintable {
}

class ViewConstraintableTests: XCTestCase {

    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 568))
    let viewTag = 15

    override func setUp() {
        super.setUp()
        let view = UIView(frame: containerView.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = viewTag
        containerView.addSubviewFittingEdges(view: view)
    }

    override func tearDown() {
        containerView.viewWithTag(viewTag)?.removeFromSuperview()
        super.tearDown()
    }

    func testAddSubviewFittingEdges() {
        let view = containerView.viewWithTag(viewTag)
        XCTAssertTrue(view != nil)
        XCTAssertEqual(containerView.constraints.filter { return $0.isActive && $0.constant == 0 }.count, 4)
    }
}
