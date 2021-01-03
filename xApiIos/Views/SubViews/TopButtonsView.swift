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
    @ObservedObject var radioManager : RadioManager

    func startStop() {
        if radioManager.isConnected {
            // CONNECTED, Stop connection
            if tester.clearAtDisconnect { tester.clearObjectsAndMessages() }
            radioManager.disconnect()

        } else {
            // DISCONNECTED, start connection
            if tester.clearAtConnect { tester.clearObjectsAndMessages() }
            radioManager.start(tester.enableGui,
                               tester.defaultConnection,
                               tester.defaultGuiConnection,
                               tester.connectToFirstRadio,
                               tester.stationName,
                               tester.clientId)
        }
    }

    var body: some View {
        
        VStack(alignment: .leading) {
            HStack (spacing: 30){
                // Top row
                Button(action: {self.startStop()} ) {
                    Text(radioManager.isConnected ? "Stop" : "Start").frame(width: 50, alignment: .leading)
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
                    Toggle(isOn: $tester.enableSmartLink) {
                        Text("Enable SmartLink")}
                   Toggle(isOn: $tester.showReplies) {
                        Text("Show Replies")}.padding(.bottom, 10)
                }.frame(width: 190)
                
                Spacer()
                
                Button(action: {
                    radioManager.clearDefaults()
                    radioManager.currentAlert = Alert(title: Text("Defaults were cleared"))
                    DispatchQueue.main.async { self.radioManager.showCurrentAlert = true }
                }) {
                    Text("Clear Defaults")
                }
                .padding(.bottom, 50)

                .alert(isPresented: $radioManager.showCurrentAlert) {
                    radioManager.currentAlert
                }
                .sheet(isPresented: $radioManager.showPickerView, onDismiss: { radioManager.connect(to: radioManager.pickerSelection) }) {
                    PickerView()
                        .environmentObject(radioManager)
                }
            }
        }
    }
}

struct TopButtonsView_Previews: PreviewProvider {

    static var previews: some View {
        TopButtonsView(radioManager: RadioManager())
            .environmentObject(Tester())
//            .environmentObject(RadioManager(delegate: Tester()))
//            .environmentObject(RadioManager())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
