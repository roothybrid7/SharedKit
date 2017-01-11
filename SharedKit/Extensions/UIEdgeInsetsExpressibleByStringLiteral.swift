//
//  UIEdgeInsetsExpressibleByStringLiteral.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/12/27.
//
//

import Foundation

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
