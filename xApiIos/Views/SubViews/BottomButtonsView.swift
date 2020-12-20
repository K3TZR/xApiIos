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
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0, content: {
            HStack (spacing: 10){
                Text("Clear on -->").frame(width: 100, alignment: .leading)
                Toggle("Connect", isOn: $tester.clearAtConnect).frame(width: 130, alignment: .leading)
                Toggle("Disconnect", isOn: $tester.clearAtDisconnect).frame(width: 150, alignment: .leading)
                Spacer()
//                Toggle("Log Window", isOn: $tester.showLogWindow).frame(width: 160, alignment: .leading)
//                Spacer()
                Button(action: {}) {Text("Clear")}
            }
        })
        .padding(.horizontal, 20)
        //    .border(Color(.textColor))
    }
}

struct BottomButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonsView()
                .environmentObject(Tester())
    }
}
