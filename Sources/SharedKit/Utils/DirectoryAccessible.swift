//
//  DirectoryAccessible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/06.
//
//

import Foundation

public enum DirectoryError: Error {
    case notParentExists
}

public protocol DirectoryAccessible {
    var rootURL: URL { get }
    func ensuredURL(to relativeDir: String?) throws -> URL
}
