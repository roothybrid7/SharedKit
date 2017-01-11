//
//  CGSizeExpressibleByStringLiteralExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/12/25.
//
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
import UIKit
#endif

@available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
extension CGSize: UIKitExpressibleByStringLiteral {

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
