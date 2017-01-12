//
//  KeyValueType.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/01.
//
//

import Foundation

/// A struct is a key to fetch object from the receiver.
public struct KeyValueType<ValType>: RawRepresentable, ExpressibleByStringLiteral {

    // MARK: RawRepresentable

    public var rawValue: String

    public init?(rawValue: String) {
        self.rawValue = rawValue
    }

    // MARK: ExpressibleByStringLiteral

    public init(stringLiteral value: String) {
        self.rawValue = value
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.rawValue = value
    }

    public init(unicodeScalarLiteral value: String) {
        self.rawValue = value
    }
}

public typealias KeyBoolType = KeyValueType<Bool>
public typealias KeyIntType = KeyValueType<Int>
public typealias KeyFloatType = KeyValueType<Float>
public typealias KeyDoubleType = KeyValueType<Double>
public typealias KeyStringType = KeyValueType<String>
public typealias KeyStringsType = KeyValueType<[String]>
