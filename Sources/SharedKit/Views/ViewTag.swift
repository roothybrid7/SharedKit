//
//  ViewTag.swift
//  SharedKit
//
//  Created by SATOSHI OHKI on 1/23/17.
//
//

import Foundation

public struct ViewTag<Taggable>: ViewTaggable {
    public typealias TaggableView = Taggable

    public var tag: Int

    /// Create a new ViewTag based on the view.tag
    ///
    /// - Parameter tag: the Int value for `viewWithTag(_:)`
    public init(tag: Int) {
        self.tag = tag
    }
}
