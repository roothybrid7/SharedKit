//
//  UIEdgeInsetsExpressibleByStringLiteral.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/12/27.
//
//

#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#endif

@available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
extension UIEdgeInsets: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        let insets = UIEdgeInsetsFromString(value)
        self.init(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        let insets = UIEdgeInsetsFromString(value)
        self.init(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }

    public init(unicodeScalarLiteral value: String) {
        let insets = UIEdgeInsetsFromString(value)
        self.init(top: insets.top, left: insets.left, bottom: insets.bottom, right: insets.right)
    }
}
