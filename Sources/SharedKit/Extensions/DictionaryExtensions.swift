//
//  DictionaryExtensions.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/10.
//
//

import Foundation

public func filtered<T>(forKeyValues keyValues: [T: Any], by keys: [T]) -> [T: Any] {
    return keyValues.filter { keys.contains($0.key) }.reduce([:]) { (result, item: (key: T, value: Any)) -> [T: Any] in
        var mResult = result
        mResult[item.key] = item.value
        return mResult
    }
}
