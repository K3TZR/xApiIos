//
//  FiltersView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct FiltersView: View {
    @ObservedObject var tester : Tester

    var body: some View {
        HStack (spacing: 40) {
            FilterView(filterType: .objects, tester: tester)
            FilterView(filterType: .messages, tester: tester)
        }
    }
}

struct FiltersView_Previews: PreviewProvider {

    static var previews: some View {
        FiltersView(tester: Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
