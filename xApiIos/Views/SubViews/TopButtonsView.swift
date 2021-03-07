//
//  TopButtonsView.swift
//  xApiIos
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI
import xClient

struct TopButtonsView: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

    var body: some View {

        HStack(spacing: 30) {
            Button(radioManager.isConnected ? "Stop" : "Start") {
                if radioManager.isConnected {
                    radioManager.disconnect()
                } else {
                    radioManager.connect()
                }
            }
            .help("Using the Default connection type")
            
            HStack(spacing: 20) {
                Toggle("Gui", isOn: $tester.enableGui).frame(width: 90)
                Toggle("Times", isOn: $tester.showTimestamps).frame(width: 105)
                Toggle("Pings", isOn: $tester.showPings).frame(width: 105)
                Toggle("Replies", isOn: $tester.showReplies).frame(width: 115)
            }
            
            Spacer()
            HStack(spacing: 10) {
                Text("SmartLink").frame(width: 90)
                Button(action: {
                    if radioManager.smartlinkIsLoggedIn {
                        radioManager.smartlinkLogout()
                    } else {
                        radioManager.smartlinkLogin()
                    }
                }) {
                    Text(radioManager.smartlinkIsLoggedIn ? "Logout" : "Login").frame(width: 75)
                }
                Button("Status") { radioManager.showView(.smartlinkStatus) }.frame(width: 50)
            }.disabled(radioManager.isConnected)
            
            Spacer()
            Button("Defaults") { radioManager.chooseDefault() }.disabled(radioManager.isConnected)
        }
    }
}

struct TopButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonsView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate) )
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
