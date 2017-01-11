//
//  RGBColor.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/10.
//
//

import Foundation
#if os(iOS)
    import UIKit
#endif

#if os(iOS)
extension UIColor {

    public convenience init(rgbaConverter converter: RGBAConverter) {
        self.init(colorLiteralRed: converter.red, green: converter.green, blue: converter.blue, alpha: converter.alpha)
    }

    public convenience init(rgbUInt value: UInt, withAlpha alpha: Float = 1.0) {
        let converter = RGBAConverter(rgbUInt: value, withAlpha: alpha)
        self.init(rgbaConverter: converter)
    }

    public convenience init(rgbHex value: String, withAlpha alpha: Float = 1.0) {
        let converter = RGBAConverter(rgbHex: value, withAlpha: alpha)
        self.init(rgbaConverter: converter)
    }
}
#endif
