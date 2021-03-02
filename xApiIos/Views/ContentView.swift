//
//  ContentView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClientIos

struct ContentView: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

   var body: some View {

        if tester.showLogWindow {
            // LOG VIEW
            LoggerView().environmentObject(Logger.sharedInstance)
            .padding(.horizontal)
            .padding(.bottom, 10)

        } else {
            // TESTER VIEW
            VStack(alignment: .leading) {
                TopButtonsView(tester: tester, radioManager: radioManager)
                SendView(tester: tester, radioManager: radioManager)
                FiltersView(tester: tester)

                Divider().frame(height: 2).background(Color(.opaqueSeparator))
                ObjectsView(objects: tester.filteredObjects, fontSize: tester.fontSize)

                Divider().frame(height: 4).background(Color(.systemBlue))
                MessagesView(messages: tester.filteredMessages, showTimestamps: tester.showTimestamps, fontSize: tester.fontSize)

                Divider().frame(height: 2).background(Color(.opaqueSeparator))
                BottomButtonsView(tester: tester)
            }
            .padding(.horizontal)

            // Sheet presentation
            .sheet(item: $radioManager.activeSheet) { sheetType in
                switch sheetType {
                case .radioPicker:   RadioPickerView()
                    .environmentObject(radioManager)
                    .onDisappear(perform: {radioManager.connect(to: radioManager.pickerSelection)})
                case .smartlinkAuthorization:    SmartlinkAuthorizationView()
                    .environmentObject(radioManager)
                    .onDisappear(perform: {print("TODO: Dismiss Auth0View")})
                case .smartlinkStatus:    SmartlinkStatusView()
                    .environmentObject(radioManager)
                    .onDisappear(perform: {print("TODO: Dismiss Auth0View")})
               }
            }

            // CustomAlert presentation
            .customAlert(isPresented: $radioManager.showAlert, radioManager.currentAlert)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate) )
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
