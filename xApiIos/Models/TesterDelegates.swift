//
//  TesterDelegates.swift
//  xApiIos
//
//  Created by Douglas Adams on 1/25/21.
//

import Foundation
import xLib6000
import SwiftyUserDefaults
import SwiftUI
import xClientIos

extension Tester: ApiDelegate, RadioManagerDelegate {

    // ----------------------------------------------------------------------------
    // MARK: - RadioManagerDelegate

    var defaultConnection: String {
        get { Defaults.defaultConnection }
        set { Defaults.defaultConnection = newValue }
    }
    var defaultGuiConnection: String {
        get { Defaults.defaultGuiConnection }
        set { Defaults.defaultGuiConnection = newValue }
    }

    public func willConnect() {
        if clearAtConnect { clearObjectsAndMessages() }
    }

    public func willDisconnect() {
        if clearAtDisconnect { clearObjectsAndMessages() }
    }

    // ----------------------------------------------------------------------------
    // MARK: - ApiDelegate

    /// Process a sent message
    ///
    /// - Parameter text:       text of the command
    ///
    public func sentMessage(_ text: String) {
        if !text.hasSuffix("|ping") { populateMessages(text) }
        if text.hasSuffix("|ping") && showPings { populateMessages(text) }
    }
    /// Process a received message
    ///
    /// - Parameter text:       text received from the Radio
    ///
    public func receivedMessage(_ text: String) {
        // get all except the first character
        let suffix = String(text.dropFirst())

        // switch on the first character
        switch text[text.startIndex] {

        case "C":   populateMessages(text)      // Commands
        case "H":   populateMessages(text)      // Handle type
        case "M":   populateMessages(text)      // Message Type
        case "R":   parseReplyMessage(suffix)   // Reply Type
        case "S":   populateMessages(text)      // Status type
        case "V":   populateMessages(text)      // Version Type
        default:    populateMessages("ERROR: Unknown Message, \(text[text.startIndex] as? CVarArg ?? "")") // Unknown Type
        }
        refreshObjects()
    }
    // unused ApiDelegate methods
    func addReplyHandler(_ sequenceNumber: SequenceNumber, replyTuple: ReplyTuple) { /* unused */ }
    func defaultReplyHandler(_ command: String, sequenceNumber: SequenceNumber, responseValue: String, reply: String) { /* unused */ }
    func vitaParser(_ vitaPacket: Vita) { /* unused */ }
}
