//
//  InfoPlistAccessible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/20.
//
//

import Foundation

/// A type that supports to access NSUserActivity in info.plist.
public protocol InfoPlistAccessible: class {

    // MARK: Object as typed for key

    func bool(forInfoDictionaryKey key: String) -> Bool
    func int(forInfoDictionaryKey key: String) -> Int
    func float(forInfoDictionaryKey key: String) -> Float
    func double(forInfoDictionaryKey key: String) -> Double
    func string(forInfoDictionaryKey key: String) -> String?
    func strings(forInfoDictionaryKey key: String) -> [String]
    func array(forInfoDictionaryKey key: String) -> [Any]
    func dictionary(forInfoDictionaryKey key: String) -> [String: Any]?
    func typedArray<ValueType>(forInfoDictionary key: String) -> [ValueType]
    func typedDictionary<ValueType>(forInfoDictionary key: String) -> [String: ValueType]?
    func objectTyped<ValueType>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType
    func objectTyped<ValueType: Collection>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index == Int
    func objectTyped<ValueType: Collection>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index: DictionaryIndexable

    // MARK: Shortcut properties

    /// All User Activity types in info.plist.
    var userActivityTypes: [String] { get }

    /// The name of the executable in this bundle.
    var executable: String? { get }

    var appVersion: String { get }

    var appBuild: String { get }

    var appIdentifierPrefix: String? { get }

    var configurationName: String? { get }

    var packageType: String { get }
}
