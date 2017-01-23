//
//  ViewHitTestable.swift
//  SharedKit
//
//  Created by SATOSHI OHKI on 1/23/17.
//
//

import Foundation
#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

@available(iOS 8, macOS 10.7, tvOS 9, *)
public protocol ViewHitTestable {
    var isHittable: Bool { get }
}

#if os(iOS) || os(tvOS)
    @available(iOS 8, tvOS 9, *)
    extension UIView: ViewHitTestable {

        public var isHittable: Bool {
            return !isHidden && isUserInteractionEnabled && alpha >= 0.01
        }
    }
#elseif os(macOS)
    @available(macOS 10.7, *)
    extension NSView: ViewHitTestable {

        public var isHittable: Bool {
            return !isHidden
        }
    }
#endif
