//
//  XApiIos.swift
//  xApiIos
//
//  Created by Douglas Adams on 3/24/21.
//

import SwiftUI
import xClient

@main
struct XApiIos: App {

    var tester: Tester
    var radioManager: RadioManager
    var meterManager: MeterManager

    init() {
        tester = Tester()
        radioManager = RadioManager(delegate: tester as RadioManagerDelegate)
        meterManager = MeterManager()
    }

    var body: some Scene {

        WindowGroup {
            ContentView(tester: tester, radioManager: radioManager, meterManager: meterManager, selectedTab: 1)
        }
    }
}
