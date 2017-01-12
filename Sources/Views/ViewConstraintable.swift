//
//  ViewConstraintable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/08/25.
//
//

import Foundation
#if os(iOS) || os(watchOS) || os(tvOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

/// LayoutConstraint helper
@available(iOS 8, macOS 10.7, tvOS 9, *)
public protocol ViewConstraintable {
    associatedtype Subview

    func addSubviewFittingEdges(view aView: Subview)

    // MARK: Protocol requirements

    func addSubview(_ view: Subview)
    func addConstraints(_ constraints: [NSLayoutConstraint])
}

@available(iOS 8, macOS 10.7, tvOS 9, *)
public extension ViewConstraintable {

    /**
        Fit content view edges to container view.

        - parameter view: an adding subview as a content view.
     */
    func addSubviewFittingEdges(view aView: Subview) {
        addSubview(aView)
        let bindings = ["view": aView]
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: bindings))
    }
}
