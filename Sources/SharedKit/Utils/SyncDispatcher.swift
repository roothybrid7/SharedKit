//
//  SyncDispatcher.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/07.
//
//

import Foundation

/// Emulate `@synchronized` of objC.
///
/// - Parameters:
///     - obj: A locked target.
///     - block: An executing closure.
///
/// - Throws: Rethrows the exception that occurred when block executing.
///
/// - Returns: The result that a block executed.
func syncExecute<Result>(withLock obj: AnyObject, processingBlock block: () throws -> Result) rethrows -> Result {
    objc_sync_enter(obj)
    defer {
        objc_sync_exit(obj)
    }
    return try block()
}

/// Specified Void type.
///
/// SeeAlso: `syncExecute<Result>(withLock:processingBlock:)`
func syncExecute(withLock obj: AnyObject, processingBlock block: () throws -> Void) rethrows {
    objc_sync_enter(obj)
    defer {
        objc_sync_exit(obj)
    }
    try block()
}
