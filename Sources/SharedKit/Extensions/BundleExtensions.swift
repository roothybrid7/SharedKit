//
//  BundleExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/01.
//
//

import Foundation

private let unknownShortVersion = "0.0.0"

public extension Bundle {

    /**
        Get application bundle.

        If an app extension is running, the container application main bundle.
        Else if an app is running, the app main bundle.
     */
    public static var appBundle: Bundle {
        var bundle = Bundle.main
        if bundle.bundleURL.pathExtension == "appex" {
            // Peel off two directory levels - MY_APP.app/PlugIns/MY_APP_EXTENSION.appex
            var url = bundle.bundleURL
            while url.pathExtension == "app" || url.pathComponents.count <= 1 {
                url = url.deletingLastPathComponent()
            }
            if let otherBundle = Bundle(url: url) {
                bundle = otherBundle
            }
        }

        return bundle
    }
}

extension Bundle: InfoPlistAccessible {

    // MARK: InfoKey

    struct InfoKey {
        static let userActivityTypes = KeyStringsType(rawValue: String(describing: NSUserActivity.self) + "Types")!
        static let shortVersion: KeyStringType = "CFBundleShortVersionString"
        /// An App ID prefix key added Info.plist.
        static let appIdentifierPrefix: KeyStringType = "AppIdentifierPrefix"
        /// An build configuration name(Debug, Release, etc.) added Info.plist
        static let configuration: KeyStringType = "Configuration"
        static let packageType: KeyStringType = "CFBundlePackageType"
    }

    // MARK: Object as typed for key

    public func bool(forInfoDictionaryKey key: String) -> Bool {
        return object(forInfoDictionaryKey: key) as? Bool ?? false
    }

    public func int(forInfoDictionaryKey key: String) -> Int {
        return object(forInfoDictionaryKey: key) as? Int ?? 0
    }

    public func float(forInfoDictionaryKey key: String) -> Float {
        return object(forInfoDictionaryKey: key) as? Float ?? 0.0
    }

    public func double(forInfoDictionaryKey key: String) -> Double {
        return object(forInfoDictionaryKey: key) as? Double ?? 0.0
    }

    public func string(forInfoDictionaryKey key: String) -> String? {
        return object(forInfoDictionaryKey: key) as? String
    }

    public func strings(forInfoDictionaryKey key: String) -> [String] {
        return object(forInfoDictionaryKey: key) as? [String] ?? []
    }

    public func array(forInfoDictionaryKey key: String) -> [Any] {
        return object(forInfoDictionaryKey: key) as? [Any] ?? []
    }

    public func dictionary(forInfoDictionaryKey key: String) -> [String: Any]? {
        return object(forInfoDictionaryKey: key) as? [String: Any]
    }

    public func typedArray<ValueType>(forInfoDictionary key: String) -> [ValueType] {
        return object(forInfoDictionaryKey: key) as? [ValueType] ?? []
    }

    public func typedDictionary<ValueType>(forInfoDictionary key: String) -> [String: ValueType]? {
        return object(forInfoDictionaryKey: key) as? [String: ValueType]
    }

    /// Returns a primitive type value.
    public func objectTyped<ValueType>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType {
        // swiftlint:disable force_cast
        switch ValueType.self {
        case is Bool.Type:
            return bool(forInfoDictionaryKey: key.rawValue) as! ValueType
        case is Int.Type:
            return int(forInfoDictionaryKey: key.rawValue) as! ValueType
        case is Float.Type:
            return float(forInfoDictionaryKey: key.rawValue) as! ValueType
        case is Double.Type:
            return double(forInfoDictionaryKey: key.rawValue) as! ValueType
        case is String.Type:
            return (string(forInfoDictionaryKey: key.rawValue) ?? "") as! ValueType
        default:
            return object(forInfoDictionaryKey: key.rawValue) as! ValueType
        }
        // swiftlint:enable force_cast
    }

    /// Overloads `objectTyped(forInfoTypedKey:)` which are also Index is Int that returns the typed array.
    public func objectTyped<ValueType: Collection>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index == Int {
        // swiftlint:disable force_cast
        return array(forInfoDictionaryKey: key.rawValue) as! ValueType
        // swiftlint:enable force_cast
    }

    /// Overloads `objectTyped(forInfoTypedKey:)` which are also Index is DictionaryIndex that returns the typed dictionary.
    public func objectTyped<ValueType: Collection>(forInfoTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index: DictionaryIndexable {
        // swiftlint:disable force_cast
        return (dictionary(forInfoDictionaryKey: key.rawValue) ?? [:]) as! ValueType
        // swiftlint:enable force_cast
    }

    // MARK: Shortcut properties

    public var userActivityTypes: [String] {
        return objectTyped(forInfoTypedKey: InfoKey.userActivityTypes)
    }

    public var executable: String? {
        return string(forInfoDictionaryKey: kCFBundleExecutableKey as String)
    }

    public var appVersion: String {
        let result = objectTyped(forInfoTypedKey: InfoKey.shortVersion)
        return result.isEmpty ? unknownShortVersion : result
    }

    public var appBuild: String {
        return string(forInfoDictionaryKey: kCFBundleVersionKey as String) ?? "0"
    }

    /**
        App identifier prefix that includes Developer Team ID.

        If the following key pair, then returns a value as TeamID + "."

            <key>AppIdentifierPrefix</key>
            <string>$(AppIdentifierPrefix)</string>
     */
    public var appIdentifierPrefix: String? {
        let result = objectTyped(forInfoTypedKey: InfoKey.appIdentifierPrefix)
        return result.isEmpty ? nil : result
    }

    /**
        A build configuration name added Info.plist.

        If the following key pair, then returns it.

        <key>Configuration</key>
        <string>$(CONFIGURATION)</string>
     */
    public var configurationName: String? {
        let result = objectTyped(forInfoTypedKey: InfoKey.configuration)
        return result.isEmpty ? nil : result
    }

    public var packageType: String {
        return objectTyped(forInfoTypedKey: InfoKey.packageType)
    }
}
