//
//  SendView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI

struct SendView: View {
    @EnvironmentObject var tester : Tester

    let buttonWidth : CGFloat = 70
    let toggleWidth : CGFloat = 190
    let hSpacing    : CGFloat = 30
    
    var body: some View {
        HStack {
            Button(action: {tester.send(command: tester.cmdToSend)}) {
                Text("Send").frame(width: buttonWidth, alignment: .leading)
            }
            .disabled(false)
            HStack {
                TextField("Command to send", text: $tester.cmdToSend)
                    .background(Color(.secondarySystemBackground))
                    .frame(width: 700, alignment: .leading)
                Spacer()
                Toggle("Clear on Send", isOn: $tester.clearOnSend).frame(width: toggleWidth)
            }
        }
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
            .environmentObject(Tester())
    }
}
