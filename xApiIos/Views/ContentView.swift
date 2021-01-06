//
//  ContentView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClientIos

struct ContentView: View {
//    @EnvironmentObject var tester: Tester
    
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager : RadioManager

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
            .sheet(isPresented: $radioManager.showSheet, onDismiss: {
                if radioManager.showPickerView {
                    radioManager.connect(to: radioManager.pickerSelection)
                } else {
                    print("TODO: Dismiss Auth0View")
                }
           }) {
                if radioManager.showPickerView {
                    PickerView()
                        .environmentObject(radioManager)
                } else {
                    Auth0View()
                        .environmentObject(radioManager)
                }
            }

//            .sheet(isPresented: $radioManager.showSheet, onDismiss: { print("Sheet was dismissed") ; radioManager.chooseDefaults() }) {
//                PickerView()
//                    .environmentObject(radioManager)
//            }
            
            // MultiAlert presentation
            .multiAlert(isPresented: $radioManager.showCurrentAlert, radioManager.currentAlert)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate) )
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
