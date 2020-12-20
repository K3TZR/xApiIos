//
//  ContentView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClientIos

struct ContentView: View {
    @EnvironmentObject var tester: Tester
    
    var body: some View {
        
        if tester.showLogWindow {
            VStack(alignment: .leading) {
                Spacer()
                LoggerView()
            }
        } else {
            VStack(alignment: .leading) {
                TopButtonsView()
                SendView()
                FiltersView()
                ObjectsView(objects: tester.filteredObjects, fontSize: tester.fontSize)
                MessagesView(messages: tester.filteredMessages, showTimestamps: tester.showTimestamps, fontSize: tester.fontSize)
                BottomButtonsView()
                StubView(radioManager: tester.radioManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 2360 / 2.0, height: 1640 / 2.0))
            .environmentObject(Tester())
    }
}
