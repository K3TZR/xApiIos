//
//  StatusView.swift
//  xApi6000
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct StatusView: View {
  @EnvironmentObject var tester : Tester
  
  var body: some View {
//    let active = tester.radioManager.activeRadio != nil
    
    VStack {
      if tester.radioManager.activeRadio != nil {Text(tester.radioManager.activePacket!.isWan ? "Wan" : "Local")}
      Text(tester.radioManager.delegate.connectAsGui ? "Gui" : "Non-Gui")
      if tester.radioManager.activeRadio != nil {Text(tester.radioManager.activePacket!.firmwareVersion)}
    }.frame(width: 75, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    .foregroundColor(.red)
  }
}

struct StatusView_Previews: PreviewProvider {
  static var previews: some View {
    StatusView()
      .environmentObject(Tester())
  }
}
