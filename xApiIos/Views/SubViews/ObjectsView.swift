//
//  ObjectsView.swift
//  xApiMac
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI

struct ObjectsView: View {
    let objects   : [Object]
    let fontSize  : Int
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 2) {
                    ForEach(objects) { object in
                        Text(object.line.text)
                            .padding(.leading, 5)
                            .font(.system(size: CGFloat(fontSize), weight: .regular, design: .monospaced))
                            .frame(minWidth: 400, maxWidth: .infinity, maxHeight: 18, alignment: .leading)
                            .foregroundColor(Color(object.line.color))
                    }
                }
            }
            Divider().frame(height: 6).background(Color(.opaqueSeparator))
        }
    }
}

struct ObjectsView_Previews: PreviewProvider {
    static var previews: some View {
        let mockObjects = [
            Object(id: 0, line: (UIColor.systemRed, "A RED object")),
            Object(id: 1, line: (UIColor.systemGreen, "A GREEN object")),
            Object(id: 2, line: (UIColor.systemBlue, "A BLUE object"))
        ]
        let mockFontSize = 20
        ObjectsView(objects: mockObjects, fontSize: mockFontSize)
            .environmentObject(Tester())
    }
}
