//
//  BottomButtonsView.swift
//  xApiIos
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI

struct BottomButtonsView: View {
    @ObservedObject var tester : Tester
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Stepper("Font Size", value: $tester.fontSize, in: 8...24).frame(width: 175)
                
                Spacer()

                HStack (spacing: 30) {
                    Toggle("Clear on Connect", isOn: $tester.clearAtConnect).frame(width: 190)
                    Toggle("Clear on Disconnect", isOn: $tester.clearAtDisconnect).frame(width: 215)
                }
                Spacer()
                
                Button(action: {self.tester.clearObjectsAndMessages()}) {Text("Clear Now")}

                Spacer()
                
                Button( action: {tester.showLogWindow.toggle()}) {Text("Log Window")}
            }
        }
    }
}

struct BottomButtonsView_Previews: PreviewProvider {

    static var previews: some View {
        BottomButtonsView(tester: Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
