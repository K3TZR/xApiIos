//
//  TopButtonsView.swift
//  xApiIos
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI
import xClientIos

struct TopButtonsView: View {
    @ObservedObject var tester : Tester
    @ObservedObject var radioManager : RadioManager
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack (spacing: 20){
                // Top row
                Button(radioManager.isConnected ? "Stop" : "Start", action: {radioManager.startStop()} )
                    .frame(width: 50, alignment: .leading)
                    .help("Using the Default connection type")
                
                Toggle("As Gui", isOn: $tester.enableGui).frame(width: 110)
                Toggle("Show Times", isOn: $tester.showTimestamps).frame(width: 150)
                
                Toggle("Show Pings", isOn: $tester.showPings).frame(width: 150)
                                
                Toggle("Show Replies", isOn: $tester.showReplies).frame(width: 160)
                Spacer()
                VStack {
                    Text("SmartLink")
                    Button(radioManager.smartLinkIsLoggedIn ? "Logout" : "Login", action: { radioManager.smartLinkLoginLogout() })
                        .frame(width: 100)
                        .disabled(radioManager.isConnected)
                }.background(Color(.secondarySystemBackground))
                Spacer()
                Button("Defaults", action: { radioManager.chooseDefaults()})
                    .disabled(radioManager.isConnected)
            }
        }

    }
}

struct TopButtonsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate) )
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
