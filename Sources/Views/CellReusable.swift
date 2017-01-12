//
//  CellReusable.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/08/25.
//
//

import Foundation
import CoreGraphics

/// Helper's definitions for a table view cell or a collection view cell.
public protocol CellReusable {
    static var reuseIdentifier: String { get }
    static var cellHeight: CGFloat { get }
    static var estimatedCellHeight: CGFloat { get }
    static var itemSize: CGSize { get }
    static var estimatedItemSize: CGSize { get }
}

public extension CellReusable {

    /// Same as class type string representation for a reusable view identifier.
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var cellHeight: CGFloat {
        return 44.0
    }

    static var estimatedCellHeight: CGFloat {
        return 44.0
    }

    static var itemSize: CGSize {
        return CGSize(width: 50.0, height: 50.0)
    }

    static var estimatedItemSize: CGSize {
        return CGSize(width: 50.0, height: 50.0)
    }
}
