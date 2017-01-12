//
//  SystemInfo.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/28.
//
//

import Foundation

#if os(iOS) || os(tvOS)
    import UIKit
#endif

public struct SystemInfo {

    public static var systemInfo: SystemInfo = {
        return SystemInfo()
    }()

    public let model: String = {
        #if os(iOS) || os(tvOS)
            return UIDevice.current.model
        #else
            return "Unknown"
        #endif
    }()

    public let osName: String = {
        #if os(iOS)
            return "iOS"
        #elseif os(watchOS)
            return "watchOS"
        #elseif os(tvOS)
            return "tvOS"
        #elseif os(macOS)
            return "macOS"
        #else
            return "Unknown"
        #endif
    }()

    /**
        The os version representation on which the process is executing.

        - Note: If the patch version is zero, it is removed.

        Example:

            1.0.0 -> 1.0
            1.0.1 -> 1.0.1
     */
    public let osVersion: String = {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        var versionPatches = [String(version.majorVersion), String(version.minorVersion)]
        if version.patchVersion > 0 {
            versionPatches.append(String(version.patchVersion))
        }
        return versionPatches.joined(separator: ".")
    }()
}
