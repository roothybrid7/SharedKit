//
//  UserDefaultsExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/04.
//
//

import Foundation

extension UserDefaults: PreferenceAccessible {

    public func setTyped<ValueType>(_ value: ValueType, forTypedKey key: KeyValueType<ValueType>) {
        set(value, forKey: key.rawValue)
    }

    public func objectTyped<ValueType>(forTypedKey key: KeyValueType<ValueType>) throws -> ValueType {
        // swiftlint:disable force_cast
        switch ValueType.self {
        case is Bool.Type:
            return bool(forKey: key.rawValue) as! ValueType
        case is Int.Type:
            return integer(forKey: key.rawValue) as! ValueType
        case is Float.Type:
            return float(forKey: key.rawValue) as! ValueType
        case is Double.Type:
            return double(forKey: key.rawValue) as! ValueType
        case is String.Type:
            return (string(forKey: key.rawValue) ?? "") as! ValueType
        case is URL.Type:
            return url(forKey: key.rawValue) as! ValueType
        case is Data.Type:
            return (data(forKey: key.rawValue) ?? Data()) as! ValueType
        default:
            return object(forKey: key.rawValue) as! ValueType
        }
        // swiftlint:enable force_cast
    }

    public func objectTyped<ValueType: Collection>(forTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index == Int {
        // swiftlint:disable force_cast
        switch ValueType.self {
        case is [String].Type:
            return (stringArray(forKey:
                key.rawValue) ?? []) as! ValueType
        default:
            return (array(forKey: key.rawValue) ?? []) as! ValueType
        }
        // swiftlint:enable force_cast
    }

    public func objectTyped<ValueType: Collection>(forTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index: DictionaryIndexable {
        // swiftlint:disable force_cast
        return (dictionary(forKey: key.rawValue) ?? [:]) as! ValueType
        // swiftlint:enable force_cast
    }
}

extension UserDefaults: BoolPreferenceSubscriptable {

    public subscript(key: KeyValueType<Bool>) -> Bool {
        get {
            return bool(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: IntPreferenceSubscriptable {

    public subscript(key: KeyValueType<Int>) -> Int {
        get {
            return integer(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: FloatPreferenceSubscriptable {

    public subscript(key: KeyValueType<Float>) -> Float {
        get {
            return float(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: DoublePreferenceSubscriptable {

    public subscript(key: KeyValueType<Double>) -> Double {
        get {
            return double(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: StringPreferenceSubscriptable {

    public subscript(key: KeyValueType<String>) -> String? {
        get {
            return string(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: URLPreferenceSubscriptable {

    public subscript(key: KeyValueType<URL>) -> URL? {
        get {
            return url(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: StringArrayPreferenceSubscriptable {

    public subscript(key: KeyValueType<[String]>) -> [String]? {
        get {
            return stringArray(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}

extension UserDefaults: DataPreferenceSubscriptable {

    public subscript(key: KeyValueType<Data>) -> Data? {
        get {
            return data(forKey: key.rawValue)
        }
        set {
            set(newValue, forKey: key.rawValue)
        }
    }
}
