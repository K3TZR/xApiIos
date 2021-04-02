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
    @ObservedObject var meterManager: MeterManager
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

            MetersView()
                .environmentObject(meterManager)
                .tabItem {Label("Meters View", systemImage: "gauge")}
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {

        Group {
            ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate), meterManager: MeterManager(), selectedTab: 1)
                .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))

            ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate), meterManager: MeterManager(), selectedTab: 2)
                .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))

            ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate), meterManager: MeterManager(), selectedTab: 3)
                .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
        }
    }
}
