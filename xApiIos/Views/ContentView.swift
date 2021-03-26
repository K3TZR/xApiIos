//
//  ContentView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClient

struct ContentView: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

    @State var selectedTab = 1

    var body: some View {

        TabView(selection: $selectedTab) {
            ApiTab(tester: tester, radioManager: radioManager)
                .tabItem {
                    Label("Api Tester", systemImage: "wifi")
                }.tag(1)

            LogTab(tester: tester, radioManager: radioManager)
                .tabItem {
                    Label("Log View", systemImage: "square.and.pencil")
                }.tag(2)
        }
    }
}

struct ApiTab: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

    var body: some View {

        VStack(alignment: .leading) {
            TopButtonsView(tester: tester, radioManager: radioManager)
            SendView(tester: tester, radioManager: radioManager)
            FiltersView(tester: tester)

            Divider().frame(height: 2).background(Color(.opaqueSeparator))
            ObjectsView(objects: tester.filteredObjects, fontSize: tester.fontSize)

            Divider().frame(height: 4).background(Color(.systemBlue))
            MessagesView(messages: tester.filteredMessages, showTimestamps: tester.showTimestamps, fontSize: tester.fontSize)

            Divider().frame(height: 2).background(Color(.opaqueSeparator))
            BottomButtonsView(tester: tester, radioManager: radioManager)
        }
        .padding(.horizontal)

        .sheet(item: $radioManager.activeView) { activeView in
            if activeView == .radioPicker {   //
                RadioPickerView().environmentObject(radioManager)
            } else if activeView == .smartlinkAuthentication {
                smartlinkAuthenticationView().environmentObject(radioManager)
            } else {
                SmartlinkStatusView().environmentObject(radioManager)
            }
        }
        .padding(.bottom, 10)
        .customAlertView(isPresented: $radioManager.showAlert, radioManager.currentAlert)
    }
}

struct LogTab: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

    var body: some View {

        LogView()
            .environmentObject(radioManager)
            .environmentObject(LogManager.sharedInstance)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate) )
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
