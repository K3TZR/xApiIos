//
//  AppExtensions.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/15/15.
//  Copyright © 2018 Douglas Adams. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

// ----------------------------------------------------------------------------
// MARK: - EXTENSIONS

typealias NC = NotificationCenter

// ----------------------------------------------------------------------------
// MARK: - Definitions for SwiftyUserDefaults

extension DefaultsKeys {
    
    var clearAtConnect          : DefaultsKey<Bool>            { .init("clearAtConnect", defaultValue: false) }
    var clearAtDisconnect       : DefaultsKey<Bool>            { .init("clearAtDisconnect", defaultValue: false) }
    var clearOnSend             : DefaultsKey<Bool>            { .init("clearOnSend", defaultValue: false) }
    var enableGui               : DefaultsKey<Bool>            { .init("enableGui", defaultValue: false) }
    var enableSmartLink         : DefaultsKey<Bool>            { .init("enableSmartLink", defaultValue: false) }
    var connectToFirstRadio     : DefaultsKey<Bool>            { .init("connectToFirstRadio", defaultValue: false) }
    var clientId                : DefaultsKey<String>          { .init("clientId", defaultValue: "") }
    var defaultConnection       : DefaultsKey<String>          { .init("defaultConnection", defaultValue: "") }
    var defaultGuiConnection    : DefaultsKey<String>          { .init("defaultGuiConnection", defaultValue: "") }
    var fontSize                : DefaultsKey<Int>             { .init("fontSize", defaultValue: 12) }
    var messagesFilterText      : DefaultsKey<String>          { .init("messagesFilterText", defaultValue: "") }
    var messagesFilterBy        : DefaultsKey<String>          { .init("messagesFilterBy", defaultValue: "none") }
    var objectsFilterText       : DefaultsKey<String>          { .init("objectsFilterText", defaultValue: "") }
    var objectsFilterBy         : DefaultsKey<String>          { .init("objectsFilterBy", defaultValue: "none") }
    var showReplies             : DefaultsKey<Bool>            { .init("showReplies", defaultValue: false) }
    var showPings               : DefaultsKey<Bool>            { .init("showPings", defaultValue: false) }
    var showTimestamps          : DefaultsKey<Bool>            { .init("showTimestamps", defaultValue: false) }
    var showLogWindow           : DefaultsKey<Bool>            { .init("showLogWindow", defaultValue: false) }
    var smartLinkAuth0Email     : DefaultsKey<String>          { .init("smartLinkAuth0Email", defaultValue: "") }
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
