//
//  ObjectFilterView.swift
//  xApiIos
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
                Picker(selection: $tester.messagesFilterBy, label: Text(tester.messagesFilterBy.rawValue).frame(width: 100)) {
                    ForEach(FilterMessages.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
            } else {
                Text("Filter objects by")
                Picker(selection: $tester.objectsFilterBy, label: Text(tester.objectsFilterBy.rawValue).frame(width: 100)) {
                    ForEach(FilterObjects.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
            }
            TextField("Filter text", text: filterType == .messages ? $tester.messagesFilterText : $tester.objectsFilterText)
                .background(Color(.secondarySystemBackground))
                .autocapitalization(.none)
        }
        .pickerStyle(MenuPickerStyle())
    }
}

struct FilterView_Previews: PreviewProvider {
    
    static var previews: some View {
        FilterView(filterType: .messages)
            .environmentObject(Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
