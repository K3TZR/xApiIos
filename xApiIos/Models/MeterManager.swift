//
//  MeterManager.swift
//  
//
//  Created by Douglas Adams on 3/30/21.
//

import Foundation
import xLib6000
import SwiftUI

final public class MeterManager: ObservableObject {
    // ----------------------------------------------------------------------------
    // MARK: - Published properties

    @Published public var filterSelection: String = "none"
    @Published public var filterText: String = ""
    @Published public var filteredMeters = [Meter]()
    @Published public var value: String = ""
    @Published public var units: String = ""

    // ----------------------------------------------------------------------------
    // MARK: - Public properties

    public enum MeterFilter: String, CaseIterable {
        case none
        case number
        case source
        case group
        case name
    }

    // ----------------------------------------------------------------------------
    // MARK: - Private properties

    private var _meters = [Meter]()
    private var _timer: DispatchSourceTimer!
    private let _timerQ: DispatchQueue!

    // ----------------------------------------------------------------------------
    // MARK: - Initialization

    public init() {
        let appName = (Bundle.main.infoDictionary?["CFBundleName"] as? String) ?? ""
        _timerQ = DispatchQueue(label: appName + ".timerQ")
        setupTimer()
    }

    // ----------------------------------------------------------------------------
    // MARK: - Public methods

    public func filterMeters(_ filterSelection: String, _ filterText: String) {
        var result = [Meter]()

        switch filterSelection {

        case MeterFilter.none.rawValue:     result = _meters
        case MeterFilter.source.rawValue:   result = _meters.filter { $0.source == filterText }
        case MeterFilter.number.rawValue:   result = _meters.filter { String($0.id) == filterText }
        case MeterFilter.name.rawValue:     result = _meters.filter { $0.name == filterText }
        case MeterFilter.group.rawValue:    result = _meters.filter { $0.group == filterText }
        default: result = _meters
        }
        DispatchQueue.main.async { [self] in filteredMeters = result }
    }

    public func loadMeters() {
        if let radio = Api.sharedInstance.radio {
            _meters = Array(radio.meters.values).sorted(by: { $0.id < $1.id })
            filterMeters(filterSelection, filterText)
        }
    }

    private func setupTimer() {
        // create the timer's dispatch source
        _timer = DispatchSource.makeTimerSource(queue: _timerQ)

        // Set timer
        _timer.schedule(deadline: DispatchTime.now(), repeating: 1)

        // set the event handler
        _timer.setEventHandler { [self] in loadMeters() }
        _timer.resume()
    }
}
