//
//  ActionableContainer.swift
//  ProttViewerApp
//
//  Created by Satoshi Ohki on 2016/12/12.
//  Copyright © 2016年 Goodpatch, Inc. All rights reserved.
//

import Foundation

public enum ContainerAction<T> {
    case clear
    case add(T)
    case remove(T)
}

public protocol ActionableContainer {
    associatedtype Element
    func transform(byAction action: ContainerAction<Element>) -> Self
    func contains(_ item: Element) -> Bool
    var count: Int { get }
    var topItem: Element? { get }
    subscript(index: Int) -> Element? { get }
}
