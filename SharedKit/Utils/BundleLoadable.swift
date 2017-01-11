//
//  BundleLoadable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/14.
//
//

import Foundation

/// A type that load by one's self.
public protocol BundleLoadable: class {
    associatedtype NibType
    static var ownedNib: NibType { get }
}

public extension BundleLoadable {

    #if os(iOS)
    /// Get the nib by same as a class name.
    static var ownedNib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }

    var ownedNib: UINib {
        return type(of: self).ownedNib
    }
    #endif
}
