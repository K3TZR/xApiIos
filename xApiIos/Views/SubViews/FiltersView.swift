//
//  FiltersView.swift
//  xApiMac
//
//  Created by Douglas Adams on 8/10/20.
//

import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var tester : Tester
    
    var body: some View {
        VStack {
            Divider().frame(height: 2).background(Color(.opaqueSeparator))
            HStack {
                FilterView(filterType: .objects)
                Spacer()
                FilterView(filterType: .messages)
            }
            .padding(.horizontal, 40)
        }
        Divider().frame(height: 2).background(Color(.opaqueSeparator))
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
            .environmentObject(Tester())
    }
}
