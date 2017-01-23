//
//  ViewTagHandling.swift
//  SharedKit
//
//  Created by SATOSHI OHKI on 1/23/17.
//
//

#if os(iOS) || os(tvOS)
    import UIKit
    public typealias TaggableView = UIView
#elseif os(macOS)
    import AppKit
    public typealias TaggableView = NSView
#endif

@available(iOS 8, macOS 10.7, tvOS 9, *)
public protocol ViewTagHandleRequirementable {
    func viewWithTag(_ tag: Int) -> TaggableView?
}

@available(iOS 8, macOS 10.7, tvOS 9, *)
public protocol ViewTagHandling: ViewTagHandleRequirementable {
    #if os(iOS) || os(tvOS)
    func taggedView<View: TaggableView, Taggable: ViewTaggable>(_ view: View, as tag: Taggable) -> Taggable.TaggableView?
    #endif
    func viewWithTag<Taggable: ViewTaggable>(_ tag: Taggable) -> Taggable.TaggableView?
}

@available(iOS 8, macOS 10.7, tvOS 9, *)
public extension ViewTagHandling {

    #if os(iOS) || os(tvOS)
    func taggedView<View: TaggableView, Taggable: ViewTaggable>(_ view: View, as tag: Taggable) -> Taggable.TaggableView? {
        guard view is Taggable.TaggableView else { return nil }
        view.tag = tag.tag
        return view as? Taggable.TaggableView
    }
    #endif

    func viewWithTag<Taggable: ViewTaggable>(_ tag: Taggable) -> Taggable.TaggableView? {
        return viewWithTag(tag.tag) as? Taggable.TaggableView
    }
}
