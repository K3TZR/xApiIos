//
//  ObjectFilterView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct FilterView: View {
    let filterType : FilterType
    @EnvironmentObject var tester : Tester

    var body: some View {
        HStack {
            if filterType == .messages {
                Text("Filter messages by")
                Picker(selection: $tester.messagesFilterBy, label: Text(tester.messagesFilterBy.rawValue)) {
                    ForEach(FilterMessages.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }.frame(width: 100, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            } else {
                Text("Filter objects by")
                Picker(selection: $tester.objectsFilterBy, label: Text(tester.objectsFilterBy.rawValue)) {
                    ForEach(FilterObjects.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }.frame(width: 100, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            }
            TextField("Filter text", text: filterType == .messages ? $tester.messagesFilterText : $tester.objectsFilterText)
              .background(Color(.secondarySystemBackground))
              .frame(width: 200, alignment: .leading)
        }
        .pickerStyle(MenuPickerStyle())
        .padding(10)
        //    .border(Color.gray, width: 0.5)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(filterType: .messages)
            .environmentObject(Tester())
    }
}
