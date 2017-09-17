//
//  RGBNSColor.swift
//  SharedKit
//
//  Created by SATOSHI OHKI on 2017/01/12.
//  Copyright © 2017年 Satoshi Ohki. All rights reserved.
//

import AppKit

@available(macOS 10.11, *)
public extension RGBConvertible where Color == NSColor {

    /// Returns an opacity color.
    var converted: Color {
        return Color(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

@available(macOS 10.11, *)
public extension RGBAConvertiable where Color == NSColor {

    /// Returns a color with the alpha component.
    var converted: Color {
        return Color(red: red, green: green, blue: blue, alpha: alpha)
    }
}

@available(macOS 10.11, *)
extension NSColor {

    public convenience init(rgbaConverter converter: RGBAConverter) {
        self.init(red: converter.red, green: converter.green, blue: converter.blue, alpha: converter.alpha)
    }

    public convenience init(rgbUInt value: UInt, withAlpha alpha: CGFloat = 1.0) {
        let converter = RGBAConverter(rgbUInt: value, withAlpha: alpha)
        self.init(rgbaConverter: converter)
    }

    public convenience init(rgbHex value: String, withAlpha alpha: CGFloat = 1.0) {
        let converter = RGBAConverter(rgbHex: value, withAlpha: alpha)
        self.init(rgbaConverter: converter)
    }
}
