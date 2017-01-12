//
//  StringExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/08.
//
//

import Foundation

public extension String {

    func whitespaceSeparated() -> String {
        let whitespaceTrimmed = trimmingCharacters(in: .whitespaces)
        guard whitespaceTrimmed.isEmpty else {
            return whitespaceTrimmed
        }
        let comps = whitespaceTrimmed.components(separatedBy: .whitespaces).filter { $0.characters.count > 0 }
        return comps.joined(separator: " ")
    }

    func camelized(_ isUppercased: Bool = false) -> String {
        var string = String(self)!
        string.camelize(isUppercased)

        return string
    }

    mutating func camelize(_ toUppercase: Bool = false) {
        if self.isEmpty { return }

        let idx = index(startIndex, offsetBy: 1)
        let firstChar = self.substring(to: idx)
        self = "".appending(toUppercase ? firstChar.uppercased() : firstChar.lowercased()).appending(substring(from: idx))
    }

    func camelToSnakecased(_ isUppercased: Bool = false) -> String {
        var string = String(self)!
        string.camelToSnakecase(isUppercased)

        return string
    }

    mutating func camelToSnakecase(_ toUppercase: Bool = false) {
        let scanner = Scanner(string: self)
        let characterSet = CharacterSet.uppercaseLetters
        scanner.charactersToBeSkipped = characterSet
        var buf: NSString? = nil
        var lastLocation = 0
        var resultString = ""
        while !scanner.isAtEnd {
            if  resultString.characters.count > 0 {
                resultString.append("_")
            }
            if scanner.scanUpToCharacters(from: characterSet, into: &buf) {
                let startIdx = index(startIndex, offsetBy: lastLocation)
                let endIdx = index(startIdx, offsetBy: scanner.scanLocation-lastLocation)
                let substr = substring(with: startIdx..<endIdx)
                resultString.append(toUppercase ? substr.uppercased() : substr.lowercased())
                lastLocation = scanner.scanLocation
            }
        }
        if resultString.characters.count > 0 {
            self = resultString
        } else {
            self = toUppercase ? uppercased() : lowercased()
        }
    }

    func snakeToCamelcased(_ toUppercase: Bool = false) -> String {
        var string = String(self)!
        string.snakeToCamelcase(toUppercase)

        return string
    }

    mutating func snakeToCamelcase(_ toUppercase: Bool = false) {
        let scanner = Scanner(string: self)
        let characterSet = CharacterSet(charactersIn: "_")
        scanner.charactersToBeSkipped = characterSet
        var buf: NSString? = nil
        var resultString = ""
        while !scanner.isAtEnd {
            if scanner.scanUpToCharacters(from: characterSet, into: &buf) {
                guard let buf = buf else { continue }

                let substr = { () -> String in
                    if resultString.characters.count <= 0 {
                        return toUppercase ? buf.capitalized : buf.lowercased
                    } else {
                        return buf.capitalized
                    }
                }()
                resultString.append(substr)
            }
        }
        self = resultString
    }
}
