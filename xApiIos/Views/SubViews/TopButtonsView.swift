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
    @EnvironmentObject var tester : Tester

    var body: some View {
        
        let stackWidth  : CGFloat = 200
        let buttonWidth : CGFloat = 80
        
        VStack(alignment: .leading) {
            HStack {
                // Top row
                Button(action: {tester.startStop()} ) {
                    Text(tester.isConnected ? "Stop" : "Start" ).frame(maxWidth: buttonWidth, alignment: .leading) }
                
                Spacer()
                
                HStack(alignment: .center) {
                    VStack (alignment: .leading)
                    {
                        Toggle(isOn: $tester.enableGui) {
                            Text("Connect as Gui").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Toggle(isOn: $tester.showTimestamps) {
                            Text("Show Times").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                                               
                    }.frame(maxWidth: stackWidth, alignment: .trailing)


                    VStack (alignment: .leading) {
                        Toggle(isOn: $tester.enablePinging) {
                            Text("Enable Pinging").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Toggle(isOn: $tester.showPings) {
                            Text("Show Pings").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }.frame(maxWidth: stackWidth, alignment: .trailing)

                    
                    VStack (alignment: .leading) {
                        Toggle(isOn: $tester.enableSmartLink) {
                            Text("Enable SmartLink").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        Toggle(isOn: $tester.showReplies) {
                            Text("Show Replies").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    .frame(maxWidth: stackWidth, alignment: .trailing)

                    Spacer()
                    
                    Button(action: {tester.smartLinkLogInOut()} ) {
                        Text(tester.smartLinkIsLoggedIn ? "SmartLink Logout" : "SmartLink Login").frame(maxWidth: buttonWidth, alignment: .center)
                    }.multilineTextAlignment(.center)
                    .disabled(!tester.enableSmartLink)
                    
                    VStack (alignment: .center) {
                        Button(action: {tester.smartLinkTest()} ) {
                            Text("Test").frame(maxWidth: buttonWidth, alignment: .center)
                            
                        }.disabled(!tester.enableSmartLink)
                        Circle()
                            .fill(tester.smartLinkTestStatus ? Color.green : Color.red)
                            .frame(width: 20, height: 20)
                    }.frame(maxWidth: buttonWidth, alignment: .center)
                }
                Spacer()
                
                VStack (spacing: 20) {
                    Button(action: {tester.chooseDefault()}) {
                        Text("Defaults").frame(maxWidth: buttonWidth, alignment: .center) }
                    Button(action: {tester.showPicker()}) {
                        Text("Picker")
                    }.frame(maxWidth: buttonWidth, alignment: .center)
                    .disabled(tester.isConnected)
                }
            }
        }
    }
}

struct TopButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonsView()
            .environmentObject(Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
