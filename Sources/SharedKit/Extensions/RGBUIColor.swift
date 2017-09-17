//
//  RGBUIColor.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/10.
//
//

import UIKit

@available(iOS 9.1, tvOS 9.0, watchOS 2.0, *)
public extension RGBConvertible where Color == UIColor {

    /// Returns an opacity color.
    var converted: Color {
        return Color(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

@available(iOS 9.1, tvOS 9.0, watchOS 2.0, *)
public extension RGBAConvertiable where Color == UIColor {

    /// Returns a color with the alpha component.
    var converted: Color {
        return Color(red: red, green: green, blue: blue, alpha: alpha)
    }
}

@available(iOS 9.1, tvOS 9.0, watchOS 2.0, *)
extension UIColor {

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
