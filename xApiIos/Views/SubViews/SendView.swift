//
//  SendView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/9/20.
//

import SwiftUI
import xClientIos

struct SendView: View {
    @ObservedObject var tester: Tester
    @ObservedObject var radioManager: RadioManager

    var body: some View {

        HStack(spacing: 40) {
            Button("Send", action: {
                    radioManager.send(command: tester.cmdToSend)
                    tester.sent(command: tester.cmdToSend)})
                .frame(width: 40, alignment: .leading)

            .disabled(!radioManager.isConnected)

            TextField("Command to send", text: $tester.cmdToSend)
                .background(Color(.secondarySystemBackground))
                .autocapitalization(.none)
                .modifier(ClearButton(text: $tester.cmdToSend))

            Spacer()

            Toggle("Clear on Send", isOn: $tester.clearOnSend).frame(width: 170)
        }
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content

            if !text.isEmpty {
                Button(action: { self.text = "" }) {
                    Image(systemName: "x.circle")
                        .foregroundColor(Color(UIColor.label))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

struct SendView_Previews: PreviewProvider {

    static var previews: some View {
        SendView(tester: Tester(), radioManager: RadioManager(delegate: Tester() as RadioManagerDelegate))
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
