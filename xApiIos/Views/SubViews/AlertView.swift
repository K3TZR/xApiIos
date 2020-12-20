//
//  AlertView.swift
//  xApi6000
//
//  Created by Douglas Adams on 12/5/20.
//

import SwiftUI

struct AlertView: View {
  @Environment(\.presentationMode) var presentation
  let title: String
  let message: String
  let buttons: [ (title: String, action: (() -> Void)?) ]
  
  var body: some View {
    VStack {
      Text(title).font(.system(size: 16))
        .padding(.vertical, 10)
      Text(message).font(.system(size: 12, weight: .regular, design: .monospaced))
      Divider()
      HStack {
        ForEach(buttons.indices, id: \.self) { i in
          Button(self.buttons[i].title) {
            (self.buttons[i].action ?? {})()
            self.presentation.wrappedValue.dismiss()
          }
          .padding()
        }
      }
    }.padding([.leading, .trailing], 40)
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    AlertView(title: "Alert Title",
              message:
"""
This is an Alert with 3 buttons
and two lines
""",
              buttons: [("Button1", nil), ("Button2", nil), ("Button3", nil)])
  }
}
