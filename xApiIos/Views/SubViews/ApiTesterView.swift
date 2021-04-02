//
//  ApiTester.swift
//  xApiIos
//
//  Created by Douglas Adams on 3/29/21.
//

import SwiftUI
import xClient

struct ApiTesterView: View {
    @EnvironmentObject var tester: Tester
    @EnvironmentObject var radioManager: RadioManager

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

struct ApiTester_Previews: PreviewProvider {
    static var previews: some View {
        ApiTesterView()
            .environmentObject(Tester())
            .environmentObject(RadioManager(delegate: Tester() as RadioManagerDelegate))
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
