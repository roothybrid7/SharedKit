//
//  NavigationBarExtendable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/23.
//
//

import Foundation
#if os(iOS)
    import UIKit
#endif

/// It defines methods and properties for controlling the bar bottom hairline.
public protocol NavigationBarExtendable: class {
    associatedtype Color
    var isHairlineHidden: Bool { get }
    func hideHairline(with color: Color)
    func clearHairline()
}

#if os(iOS)
extension UINavigationBar: NavigationBarExtendable {
    public typealias Color = UIColor
    public var isHairlineHidden: Bool {
        return shadowImage != nil && backgroundImage(for: .default) != nil
    }

    public func hideHairline(with color: Color) {
        shadowImage = UIImage()
        setBackgroundImage(color.convertedImage, for: .default)
        setNeedsDisplay()
    }

    public func clearHairline() {
        shadowImage = nil
        setBackgroundImage(nil, for: .default)
        setNeedsDisplay()
    }
}
#endif
