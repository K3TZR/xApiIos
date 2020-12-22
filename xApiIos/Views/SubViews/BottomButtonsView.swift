//
//  BottomButtonsView.swift
//  xApiMac
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI

struct BottomButtonsView: View {
    @EnvironmentObject var tester : Tester
    
    let buttonWidth : CGFloat = 70
    let toggleWidth : CGFloat = 215
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack  {
                Stepper("Font Size", value: $tester.fontSize, in: 8...24).frame(width: 175)
                
                Spacer()
                
                Toggle(isOn: $tester.clearAtConnect) {
                    Text("Clear on Connect").frame(maxWidth: .infinity, alignment: .trailing)
                }.frame(maxWidth: 150, alignment: .trailing)
                
                Spacer()
                
                Toggle(isOn: $tester.clearAtDisconnect) {
                    Text("Clear on Disconnect").frame(maxWidth: .infinity, alignment: .trailing)
                }.frame(maxWidth: 150, alignment: .trailing)
                
                Spacer()
                
                Button(action: {tester.clearObjectsAndMessages()}) {Text("Clear Now")}
                
                Spacer()
                
                Button(action: {tester.showLogWindow.toggle()}) {
                    Text("Log View").frame(width: buttonWidth)
                }
            }
        }
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView()
            .environmentObject(Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
