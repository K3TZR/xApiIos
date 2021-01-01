//
//  FiltersView.swift
//  xApiIos
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct FiltersView: View {
    
    var body: some View {
        HStack (spacing: 40) {
            FilterView(filterType: .objects)
            FilterView(filterType: .messages)
        }
    }
}

struct FiltersView_Previews: PreviewProvider {

    static var previews: some View {
        FiltersView()
            .environmentObject(Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
