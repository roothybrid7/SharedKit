//
//  URLQueryItemFinder.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/12/03.
//
//

import Foundation

public protocol URLQueryItemContainerable {
    var queryItems: [URLQueryItem]? { get }
}

// Already conformed
extension URLComponents: URLQueryItemContainerable {}

public func findQueryItem(queryItems: [URLQueryItem], name: String) -> URLQueryItem? {
    return queryItems.filter { (queryItem) -> Bool in
        queryItem.name == name
    }.first
}

public func findQueryItem<T: URLQueryItemContainerable>(container: T, name: String) -> URLQueryItem? {
    guard let queryItems = container.queryItems else { return nil }
    return findQueryItem(queryItems: queryItems, name: name)
}
