//
//  SendView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI

struct SendView: View {
    @EnvironmentObject var tester : Tester
    
    var body: some View {
        HStack {
            Button(action: {tester.send(command: tester.cmdToSend)}) {
                Text("Send").frame(width: 70, alignment: .center)
            }.padding(.horizontal)
            .disabled(false)
            HStack {
                TextField("Command to send", text: $tester.cmdToSend)
                    .background(Color(.secondarySystemBackground))
                    .frame(width: 700, alignment: .leading)
                Spacer()
                Toggle("Clear on Send", isOn: $tester.clearOnSend).frame(width: 170, alignment: .leading)
            }
        }
        .padding(.trailing, 10)
    }
}

struct SendView_Previews: PreviewProvider {
    static var previews: some View {
        SendView()
            .environmentObject(Tester())
    }
}
