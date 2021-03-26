//
//  AppExtensions.swift
//
//
//  Created by Douglas Adams on 8/15/15.
//  Copyright © 2018 Douglas Adams. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

// ----------------------------------------------------------------------------
// MARK: - EXTENSIONS

// ----------------------------------------------------------------------------
// MARK: - Definitions for SwiftyUserDefaults

extension DefaultsKeys {

    var clearAtConnect: DefaultsKey<Bool> { .init("clearAtConnect", defaultValue: false) }
    var clearAtDisconnect: DefaultsKey<Bool> { .init("clearAtDisconnect", defaultValue: false) }
    var clearOnSend: DefaultsKey<Bool> { .init("clearOnSend", defaultValue: false) }
    var connectToFirstRadioIsEnabled: DefaultsKey<Bool> { .init("connectToFirstRadioIsEnabled", defaultValue: false) }
    var clientId: DefaultsKey<String?> { .init("clientId") }
    var defaultConnection: DefaultsKey<String?> { .init("defaultConnection") }
    var defaultGuiConnection: DefaultsKey<String?> { .init("defaultGuiConnection") }
    var fontMaxSize: DefaultsKey<Int> { .init("fontMaxSize", defaultValue: 20) }
    var fontMinSize: DefaultsKey<Int> { .init("fontMinSize", defaultValue: 8) }
    var fontName: DefaultsKey<String> { .init("fontName", defaultValue: "Monaco") }
    var fontSize: DefaultsKey<Int> { .init("fontSize", defaultValue: 12) }
    var guiIsEnabled: DefaultsKey<Bool> { .init("guiIsEnabled", defaultValue: false) }
    var messagesFilterText: DefaultsKey<String> { .init("messagesFilterText", defaultValue: "") }
    var messagesFilterBy: DefaultsKey<String> { .init("messagesFilterBy", defaultValue: "none") }
    var objectsFilterText: DefaultsKey<String> { .init("objectsFilterText", defaultValue: "") }
    var objectsFilterBy: DefaultsKey<String> { .init("objectsFilterBy", defaultValue: "none") }
    var showReplies: DefaultsKey<Bool> { .init("showReplies", defaultValue: false) }
    var showPings: DefaultsKey<Bool> { .init("showPings", defaultValue: false) }
    var showTimestamps: DefaultsKey<Bool> { .init("showTimestamps", defaultValue: false) }
    var smartlinkEmail: DefaultsKey<String?> { .init("smartlinkEmail") }
    var smartlinkIsEnabled: DefaultsKey<Bool> { .init("smartlinkIsEnabled", defaultValue: true) }
    var useLowBw: DefaultsKey<Bool> { .init("useLowBw", defaultValue: false) }
}

/// Struct to hold a Semantic Version number
///     with provision for a Build Number
///
public struct Version {
    var major: Int = 1
    var minor: Int = 0
    var patch: Int = 0
    var build: Int = 1

    public init(_ versionString: String = "1.0.0") {

        let components = versionString.components(separatedBy: ".")
        switch components.count {
        case 3:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            patch = Int(components[2]) ?? 0
            build = 1
        case 4:
            major = Int(components[0]) ?? 1
            minor = Int(components[1]) ?? 0
            patch = Int(components[2]) ?? 0
            build = Int(components[3]) ?? 1
        default:
            major = 1
            minor = 0
            patch = 0
            build = 1
        }
    }

    public init() {
        // only useful for Apps & Frameworks (which have a Bundle), not Packages
        let versions = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? "?"
        let build   = Bundle.main.infoDictionary![kCFBundleVersionKey as String] as? String ?? "?"
        self.init(versions + ".\(build)")
    }

    public var longString: String { "\(major).\(minor).\(patch) (\(build))" }
    public var string: String { "\(major).\(minor).\(patch)" }

    public var isV3: Bool { major >= 3 }
    public var isV2NewApi: Bool { major == 2 && minor >= 5 }
    public var isGreaterThanV22: Bool { major >= 2 && minor >= 2 }
    public var isV2: Bool { major == 2 && minor < 5 }
    public var isV1: Bool { major == 1 }

    public var isNewApi: Bool { isV3 || isV2NewApi }
    public var isOldApi: Bool { isV1 || isV2 }

    static func == (lhs: Version, rhs: Version) -> Bool { lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch == rhs.patch }

    static func < (lhs: Version, rhs: Version) -> Bool {

        switch (lhs, rhs) {

        case (let lhs, let rhs) where lhs == rhs: return false
        case (let lhs, let rhs) where lhs.major < rhs.major: return true
        case (let lhs, let rhs) where lhs.major == rhs.major && lhs.minor < rhs.minor: return true
        case (let lhs, let rhs) where lhs.major == rhs.major && lhs.minor == rhs.minor && lhs.patch < rhs.patch: return true
        default: return false
        }
    }
}

extension String {

    /// Pad a string to a fixed length
    /// - Parameters:
    ///   - len:            the desired length
    ///   - padCharacter:   the character to pad with
    /// - Returns:          a padded string
    ///
    func padTo(_ len: Int, with padCharacter: String = " ") -> String {
        String((self + "               ").prefix(len))
    }
}
