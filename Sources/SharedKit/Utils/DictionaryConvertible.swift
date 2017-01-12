//
//  DictionaryConvertible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/28.
//
//

import Foundation

/**
    A type that can convert Dictionary.

    Here is an example:

        struct Foo: DictionaryConvertible {
            var bar: String = "bar"
            var buz: Int = 1

            func asDictionary() -> [String: Any] {
                return ["bar": bar, "buz": buz]
            }
        }
 */
public protocol DictionaryConvertible {
    associatedtype Key: Hashable
    associatedtype Value

    func asDictionary() -> [Key: Value]
}
