//
//  PaddingContentSizable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/18.
//
//

import Foundation
#if os(iOS)
    import UIKit
#endif

public protocol PaddingContentSizable: class {
    var padding: UIEdgeInsets { get set }
    func intrinsicContentSizeToAddPadding() -> CGSize
}

#if os(iOS)
public extension PaddingContentSizable where Self: UIView {

    public func intrinsicContentSizeToAddPadding() -> CGSize {
        let originalSize = self.sizeThatFits(bounds.size)
        return CGSize(width: originalSize.width + padding.left + padding.right, height: originalSize.height + padding.top + padding.bottom)
    }
}
#endif
