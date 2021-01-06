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
            HStack (spacing: 30){
                // Top row
                Button(action: {radioManager.startStop()} ) {
                    Text(radioManager.isConnected ? "Stop" : "Start").frame(width: 50, alignment: .leading)
                }                
                .help("Using the Default connection type")
                .padding(.bottom, 50)

//                Spacer()
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.enableGui) {
                        Text("As Gui") }
                    Toggle(isOn: $tester.showTimestamps) {
                        Text("Show Times") }.padding(.bottom, 10)
                }.frame(width: 150)
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.showPings) {
                        Text("Show Pings")}
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                }.frame(width: 160)
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.showReplies) {
                        Text("Show Replies")}
                        .padding(.top, 40)
                        .padding(.bottom, 10)
                }.frame(width: 190)
                
               Spacer()
                
                VStack {
                    Text("SmartLink")
                    Button(action: { radioManager.smartLinkLoginLogout() }) {
                        Text(radioManager.smartLinkIsLoggedIn ? "Logout" : "Login")
                    }.padding(.bottom, 30)
                }

                Spacer()
                
                Button(action: { radioManager.chooseDefaults()
                }) {
                    Text("Defaults")
                }
                .padding(.bottom, 50)

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
