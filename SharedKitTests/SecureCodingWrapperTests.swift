//
//  SecureCodingWrapperTests.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/23.
//
//

import XCTest
@testable import SharedKit

struct TestCoder {
    let id: Int?
    let text: String?
}

struct TestCoder2 {
    let id: Int?
    let text: String?
}

extension TestCoder: SecureCodable {

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(text, forKey: "text")
    }

    init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.text = aDecoder.decodeObject(forKey: "text") as? String
    }
}

extension TestCoder2: SecureCodable {

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(text, forKey: "text")
    }

    init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.text = aDecoder.decodeObject(forKey: "text") as? String
    }
}

class SecureCodingWrapperTests: XCTestCase {

    let testCoderSources: [(id: Int?, text: String?)] = [
        (id: nil, text: nil),
        (id: nil, text: ""),
        (id: 12345, text: nil),
        (id: 12345, text: "test"),
        (id: nil, text: "test")
    ]

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testCodings() {
        for (id, text) in testCoderSources {
            let testCoder = TestCoder(id: id, text: text)
            let data = testCoder.archive()
            let unarchived = TestCoder.unarchive(with: data)
            XCTAssertNotNil(unarchived)
            XCTAssertEqual(unarchived?.id, id)
            XCTAssertEqual(unarchived?.text, text)
        }
        for (id, text) in testCoderSources {
            let testCoder = TestCoder2(id: id, text: text)
            let data = testCoder.archive()
            let unarchived = TestCoder2.unarchive(with: data)
            XCTAssertNotNil(unarchived)
            XCTAssertEqual(unarchived?.id, id)
            XCTAssertEqual(unarchived?.text, text)
        }
    }
}
