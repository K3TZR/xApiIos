//
//  TopButtonsView.swift
//  xApiMac
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI
import xClientIos

struct TopButtonsView: View {
    @EnvironmentObject var tester : Tester
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                // Top row
                Button(action: {tester.startStop()}) {
                    Text(tester.isConnected ? "Stop" : "Start" ).frame(width: 70, alignment: .center)
                }.padding(.horizontal)

                HStack (spacing: 20){
                    Text("Enable -->").frame(width: 90, alignment: .leading)
                    Toggle("Gui", isOn: $tester.enableGui).frame(width: 110, alignment: .leading)
                    Toggle("Pinging", isOn: $tester.enablePinging).frame(width: 120, alignment: .leading)
                    Toggle("SmartLink", isOn: $tester.enableSmartLink).frame(width: 140, alignment: .leading)
                    
                    Button(action: { if tester.smartLinkIsLoggedIn {
                        tester.radioManager.smartLinkLogout()
                    } else {
                        tester.radioManager.smartLinkLogin()
                    }
                    }) {
                        Text(tester.smartLinkIsLoggedIn ? "Logout" : "Login").frame(width: 70, alignment: .center)
                    }.padding(.trailing, 10)
                    .disabled(!tester.enableSmartLink)
                    
                    Button(action: {tester.radioManager.smartLinkTest()}) {
                        Text("Test").frame(width: 70, alignment: .center)
                    }
                    .disabled(!tester.enableSmartLink)
                    
                    Circle()
                        .fill(tester.smartLinkTestStatus ? Color.green : Color.red)
                        .frame(width: 20, height: 20)
                    Spacer()
                    
                    Button(action: {tester.showLogWindow.toggle()}) {
                        Text("Log View").frame(width: 70, alignment: .center)
                    }.padding(.trailing, 10)
                }
                .padding(5)
            }
            
            // Bottom row
            HStack(spacing: 20) {
                Text("Show -->").frame(width: 90, alignment: .leading).padding(.leading, 115)
                Toggle("Times", isOn: $tester.showTimestamps).frame(width: 110, alignment: .leading)
                Toggle("Pings", isOn: $tester.showPings).frame(width: 120, alignment: .leading)
                Toggle("Replies", isOn: $tester.showReplies).frame(width: 140, alignment: .leading)
                
                Spacer()
                
                Button(action: {tester.radioManager.chooseDefault()}) {
                    Text("Defaults").frame(width: 70, alignment: .center)
                }.padding(.trailing, 10)
                Button(action: {tester.radioManager.showPicker()}) {
                    Text("Picker").frame(width: 70, alignment: .center)
                }.padding(.trailing, 10)
                .disabled(tester.isConnected)
            }
        }
    }
}

struct TopButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonsView()
            .previewLayout(.fixed(width: 2360 / 2.0, height: 1640 / 2.0))
//            .preferredColorScheme(.dark)
            .environmentObject(Tester())
    }
}
