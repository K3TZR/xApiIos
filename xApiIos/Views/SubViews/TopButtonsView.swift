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
    @EnvironmentObject var radioManager : RadioManager

    @State var showDefaultsAlert = false

    var body: some View {
        
        VStack(alignment: .leading) {
            HStack (spacing: 20){
                // Top row
                Button(action: {tester.startStop()} ) {
                    Text(tester.isConnected ? "Stop" : "Start" ).frame(width: 50, alignment: .leading)
                }                
                .help("Using the Default connection type")
                .padding(.bottom, 50)

                Spacer()
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.enableGui) {
                        Text("As Gui") }
                    Toggle(isOn: $tester.showTimestamps) {
                        Text("Show Times") }.padding(.bottom, 10)
                }.frame(width: 150)
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.connectToFirstRadio) {
                        Text("Default to 1st")}
                    Toggle(isOn: $tester.showPings) {
                        Text("Show Pings")}.padding(.bottom, 10)
                }.frame(width: 160)
                
                VStack (alignment: .leading) {
                    Toggle(isOn: $tester.enablePinging) {
                        Text("Enable Ping")}
                    Toggle(isOn: $tester.showReplies) {
                        Text("Show Replies")}.padding(.bottom, 10)
                }.frame(width: 160)
                
                Toggle(isOn: $tester.enableSmartLink) {
                    Text("Enable SmartLink")
                    
                }.padding(.bottom, 50).frame(width: 200)
                
                Spacer()
                
                Button(action: {tester.clearDefaults() }) {
                    Text("Clear Defaults")
                }
                .padding(.bottom, 50)

                .alert(isPresented: $tester.showCurrentAlert) {
                    tester.currentAlert
                }
                .sheet(isPresented: $tester.showPickerView, onDismiss: { tester.radioManager.connect(to: tester.radioManager.pickerSelection) }) {
                    PickerView().environmentObject(radioManager)
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
