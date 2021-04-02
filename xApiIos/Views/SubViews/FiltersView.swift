//
//  FiltersView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var tester: Tester

    var body: some View {
        HStack(spacing: 40) {
            FilterView(selection: $tester.objectsFilterBy,
                        text: $tester.objectsFilterText,
                        choices: FilterObjects.allCases.map {$0.rawValue},
                        message: "Filter Objects by")
            FilterView(selection: $tester.messagesFilterBy,
                        text: $tester.messagesFilterText,
                        choices: FilterMessages.allCases.map {$0.rawValue},
                        message: "Filter Messages by")
        }
    }
}

struct FiltersView_Previews: PreviewProvider {

    static var previews: some View {
        FiltersView(tester: Tester())
            .previewDevice("iPad (8th generation)")
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
