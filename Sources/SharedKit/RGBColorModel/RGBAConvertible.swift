//
//  RGBAConvertible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/09.
//
//

import Foundation

/// A type that support to convert rgb color values.
public protocol RGBConvertible {
    associatedtype Color

    /// A converted Integer representation of rgb from hex value.
    static func rgbUInt(from hex: String) -> UInt

    var red: Float { get set }
    var green: Float { get set }
    var blue: Float { get set }

    /// Returns a color object from a rgb color value.
    var converted: Color { get }
}

/// A type that support to convert rgba color values.
public protocol RGBAConvertiable: RGBConvertible {
    var alpha: Float { get set }
}

public extension RGBConvertible {

    static func rgbUInt(from hex: String) -> UInt {
        let parser = RGBHexParser(hexString: hex)
        return parser.parsed ?? 0
    }
}
