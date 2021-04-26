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
    @State var selectedTab: Int

    var body: some View {

        TabView(selection: $selectedTab) {
            ApiTesterView()
                .environmentObject(tester)
                .environmentObject(radioManager)
                .tabItem { Label("Api Tester", systemImage: "wifi")}
                .tag(1)

            LogView()
                .environmentObject(LogManager.sharedInstance)
                .environmentObject(radioManager)
                .tabItem {Label("Log View", systemImage: "square.and.pencil")}
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate), selectedTab: 1)
            ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate), selectedTab: 2)
        }
        .previewDevice("iPad (8th generation)")
        .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
