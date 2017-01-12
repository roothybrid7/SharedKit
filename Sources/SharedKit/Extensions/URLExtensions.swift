//
//  URLExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/13.
//
//

import Foundation

/// A type is that extract the origin of the represented URL.
///
/// see: [HTMLHyperlinkElementUtils.origin - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/HTMLHyperlinkElementUtils/origin)
public protocol URLOriginExtractable {
    var extractOriginPattern: String { get }
    var extractOriginExpression: NSRegularExpression { get }
    var origin: String? { get }
}

/// The adaption type of URL or URLComponents.
public protocol URLOriginExtractRequirementable {

    var absoluteString: String { get }
    var path: String { get }
}

public extension URLOriginExtractable where Self: URLOriginExtractRequirementable {

    var extractOriginPattern: String {
        return "^(.*)\(path).*"
    }

    var extractOriginExpression: NSRegularExpression {
        return try! NSRegularExpression(pattern: extractOriginPattern, options: []) // swiftlint:disable:this force_try
    }

    var origin: String? {
        guard let match = extractOriginExpression.firstMatch(in: absoluteString, range: NSRange(location: 0, length: absoluteString.characters.count)) else {
            return nil
        }
        let result = (absoluteString as NSString).substring(with: match.rangeAt(1))
        return result
    }
}

// MARK: - <URLOriginExtractRequirementable>

extension URL: URLOriginExtractRequirementable {}

extension URLComponents: URLOriginExtractRequirementable {
    public var absoluteString: String {
        return self.url!.absoluteString
    }
}

// MARK: - <URLOriginExtractable>

extension URL: URLOriginExtractable {}
extension URLComponents: URLOriginExtractable {}

// MARK: - is absolute url

public extension URL {

    var isAbsoluteURL: Bool {
        if let _ = scheme, let _ = host {
            return true
        }
        return false
    }
}

public extension URLComponents {

    var isAbsoluteURL: Bool {
        if let _ = scheme, let _ = host {
            return true
        }
        return false
    }
}
