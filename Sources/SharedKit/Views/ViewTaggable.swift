//
//  ViewTaggable.swift
//  SharedKit
//
//  Created by SATOSHI OHKI on 1/23/17.
//
//

import Foundation

public protocol ViewTaggable {
    associatedtype TaggableView
    var tag: Int { get }
}
