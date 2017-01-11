//
//  PreferenceAccessible.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/11/04.
//
//

import Foundation

public protocol PreferenceAccessible {
    func setTyped<ValueType>(_ value: ValueType, forTypedKey key: KeyValueType<ValueType>)
    func objectTyped<ValueType>(forTypedKey key: KeyValueType<ValueType>) throws -> ValueType
    func objectTyped<ValueType: Collection>(forTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index == Int
    func objectTyped<ValueType: Collection>(forTypedKey key: KeyValueType<ValueType>) -> ValueType where ValueType.Index: DictionaryIndexable
}

public protocol BoolPreferenceSubscriptable {
    subscript(key: KeyValueType<Bool>) -> Bool { get set }
}

public protocol IntPreferenceSubscriptable {
    subscript(key: KeyValueType<Int>) -> Int { get set }
}

public protocol FloatPreferenceSubscriptable {
    subscript(key: KeyValueType<Float>) -> Float { get set}
}

public protocol DoublePreferenceSubscriptable {
    subscript(key: KeyValueType<Double>) -> Double { get set }
}

public protocol StringPreferenceSubscriptable {
    subscript(key: KeyValueType<String>) -> String? { get set }
}

public protocol URLPreferenceSubscriptable {
    subscript(key: KeyValueType<URL>) -> URL? { get set }
}

public protocol StringArrayPreferenceSubscriptable {
    subscript(key: KeyValueType<[String]>) -> [String]? { get set }
}

public protocol DataPreferenceSubscriptable {
    subscript(key: KeyValueType<Data>) -> Data? { get set }
}
