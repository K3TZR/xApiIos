//
//  ContentView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClientIos

struct ContentView: View {
    @EnvironmentObject var tester: Tester
    @StateObject var radioManager = RadioManager()

    var body: some View {
        
        if tester.showLogWindow {
            VStack(alignment: .leading) {
                Spacer()
                LoggerView()
            }
            .padding(.horizontal)
            .padding(.bottom, 10)

        } else {
            VStack(alignment: .leading) {
                TopButtonsView(radioManager: radioManager)

                SendView(radioManager: radioManager)
                FiltersView()

                Divider().frame(height: 2).background(Color(.opaqueSeparator))

                ObjectsView(objects: tester.filteredObjects, fontSize: tester.fontSize)
                
                Divider().frame(height: 4).background(Color(.systemBlue))

                MessagesView(messages: tester.filteredMessages, showTimestamps: tester.showTimestamps, fontSize: tester.fontSize)
                
                Divider().frame(height: 2).background(Color(.opaqueSeparator))

                BottomButtonsView()

//                StubView()
            }
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Tester())
//            .environmentObject(RadioManager(delegate: Tester()))
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
