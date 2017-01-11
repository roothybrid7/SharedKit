//
//  CGSizeExpressibleByStringLiteralExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/12/25.
//
//

import Foundation

extension CGSize: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }
    public init(extendedGraphemeClusterLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }

    public init(unicodeScalarLiteral value: String) {
        let size = CGSizeFromString(value)
        self.init(width: size.width, height: size.height)
    }
}
