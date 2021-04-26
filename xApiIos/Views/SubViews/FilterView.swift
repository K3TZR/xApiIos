//
//  FilterView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI
import xClient

struct FilterView: View {
    @Binding var selection: String
    @Binding var text: String
    let choices: [String]
    let message: String

    var body: some View {

        HStack {
            Text(message)
            Picker(selection, selection: $selection) {
                ForEach(choices, id: \.self) {
                    Text($0)
                }
            }.frame(width: 100)

            TextField("Filter text", text: $text)
                .modifier(ClearButton(boundText: $text))
        }
        .pickerStyle(MenuPickerStyle())
    }
}

struct FilterView_Previews: PreviewProvider {

    static var previews: some View {
        FilterView(selection: .constant("none"),
                   text: .constant(""),
                    choices: FilterObjects.allCases.map {$0.rawValue},
                    message: "Filter Objects by")
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
