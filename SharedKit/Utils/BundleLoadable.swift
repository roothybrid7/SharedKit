//
//  BundleLoadable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/14.
//
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#endif

/// A type that load by one's self.
public protocol BundleLoadable: class {
    associatedtype NibType
    static var ownedNib: NibType { get }
}

@available(iOS 8.0, tvOS 9.0, *)
public extension BundleLoadable where NibType == UINib {

    /// Get the nib by same as a class name.
    static var ownedNib: NibType {
        return NibType(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    var ownedNib: NibType {
        return type(of: self).ownedNib
    }
}
