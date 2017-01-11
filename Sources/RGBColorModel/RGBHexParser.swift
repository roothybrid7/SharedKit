//
//  RGBHexParser.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/09.
//
//

import Foundation

/// A type that supports to parse a color hex string to UInt.
public protocol RGBHexParsable {
    static var rgbHexExpression: NSRegularExpression { get }
    /// A target value that should be parsed.
    var value: String { get set }
    /// A parsed result value of a target value.
    var parsed: UInt? { get }
}

/**
    A structure is a parser that parse a color hex string to UInt value.

        #000000->0
        #000->0
 */
public struct RGBHexParser: RGBHexParsable, ExpressibleByStringLiteral {

    private static let rgbPattern = "([0-9a-f])"

    public static let rgbHexExpression: NSRegularExpression = try! NSRegularExpression(pattern: rgbPattern, options: [.caseInsensitive])   // swiftlint:disable:this force_try

    public var value: String

    public init(hexString value: String) {
        self.value = value
    }

    public init(stringLiteral value: String) {
        self.init(hexString: value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(hexString: value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(hexString: value)
    }

    public var parsed: UInt? {
        var code = value
        if value.hasPrefix("#") {
            code = value.substring(to: value.index(before: value.endIndex))
        }
        let matches = type(of: self).rgbHexExpression.matches(in: code, range: NSRange(location: 0, length: code.characters.count))
        if matches.count != 3 && matches.count != 6 {
            return nil
        } else if matches.count == 3 {
            code = matches.map { (code as NSString).substring(with: $0.rangeAt(1)) }.map { $0 + $0 }.joined()
        }
        let scanner = Scanner(string: code)
        var result: UInt32 = 0
        scanner.scanHexInt32(&result)
        return UInt(result)
    }
}
