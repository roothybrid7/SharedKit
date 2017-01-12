//
//  RGBConverter.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/10.
//
//

import Foundation

/// A structure is a converter to get color object that use color values of 8-bit red, green, blue and an alpha value.
public struct RGBAConverter: RGBAConvertiable, ExpressibleByIntegerLiteral, ExpressibleByStringLiteral {
    public var red: Float
    public var green: Float
    public var blue: Float
    public var alpha: Float = 1.0

    public init(rgbUInt value: UInt, withAlpha alpha: Float = 1.0) {
        self.red = Float(value & 0xff0000 >> 16) / 255.0
        self.green = Float(value & 0x00ff00 >> 8) / 255.0
        self.blue = Float(value & 0x0000ff) / 255.0
        self.alpha = alpha
    }

    public init(rgbHex value: String, withAlpha alpha: Float = 1.0) {
        self.init(rgbUInt: type(of: self).rgbUInt(from: value), withAlpha: alpha)
    }

    public init(integerLiteral value: UInt) {
        self.init(rgbUInt: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(rgbHex: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(rgbHex: value)
    }

    public init(stringLiteral value: String) {
        self.init(rgbHex: value)
    }
}
