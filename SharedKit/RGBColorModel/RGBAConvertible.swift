//
//  RGBAConvertible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/09.
//
//

import Foundation

#if os(iOS)
    import UIKit
#endif

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

#if os(iOS)
public extension RGBConvertible where Color == UIColor {

    /// Returns an opacity color.
    var converted: Color {
        return Color(colorLiteralRed: red, green: green, blue: blue, alpha: 1.0)
    }
}

public extension RGBAConvertiable where Color == UIColor {

    /// Returns a color with the alpha component.
    var converted: Color {
        return Color(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
}
#endif
