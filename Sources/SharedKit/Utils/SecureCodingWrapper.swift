//
//  SecureCodingWrapper.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/09/23.
//
//

import Foundation

/// A type for archiving that supports NSSecureCoding to a Swift structure and enum.
public protocol SecureCodable {
    /// Encodes the receiver using a given archiver and .
    func encode(with aCoder: NSCoder)
    /// Returns an object initialized from data in a given unarchiver by SecureCodingWrapper.
    init?(coder aDecoder: NSCoder)
    /// Returns an object of SecureCodingWrapper class.
    var codingWrapper: SecureCodingWrapper<Self> { get }

    // MARK: Archive helpers

    func archive() -> Data
    static func unarchive(with data: Data) -> Self?
}

public extension SecureCodable {

    var codingWrapper: SecureCodingWrapper<Self> {
        return SecureCodingWrapper(for: self)
    }

    func archive() -> Data {
        // XXX: Remove the namespace such as module name for mapping an archived data.
        //
        // *** -[NSKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class (_TtGC9SharedKit19SecureCodingWrapperV11MyFramework23NSCodingMyClass_) for key (root);
        // the class may be defined in source code or a library that is not linked(null)
        NSKeyedArchiver.setClassName(String(describing: type(of: self)), for: SecureCodingWrapper<Self>.self)
        return NSKeyedArchiver.archivedData(withRootObject: codingWrapper)
    }

    static func unarchive(with data: Data) -> Self? {
        // XXX: Remove the namespace such as module name for mapping an archived data.
        //
        // *** -[NSKeyedUnarchiver decodeObjectForKey:]: cannot decode object of class (_TtGC9SharedKit19SecureCodingWrapperV11MyFramework23NSCodingMyClass_) for key (root);
        // the class may be defined in source code or a library that is not linked(null)
        NSKeyedUnarchiver.setClass(SecureCodingWrapper<Self>.self, forClassName: String(describing: self))
        let codingWrapper = NSKeyedUnarchiver.unarchiveObject(with: data) as? SecureCodingWrapper<Self>
        return codingWrapper?.object
    }
}

public class SecureCodingWrapper<Base: SecureCodable>: NSObject, NSSecureCoding {
    var object: Base?

    fileprivate init(for object: Base) {
        self.object = object
        super.init()
    }

    public func encode(with aCoder: NSCoder) {
        object?.encode(with: aCoder)
    }

    public required init?(coder aDecoder: NSCoder) {
        object = Base(coder: aDecoder)
        super.init()
    }

    public static var supportsSecureCoding: Bool {
        return true
    }
}
