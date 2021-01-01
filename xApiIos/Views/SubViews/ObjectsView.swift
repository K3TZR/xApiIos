//
//  ObjectsView.swift
//  xApiIos
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI

struct ObjectsView: View {
    let objects   : [Object]
    let fontSize  : Int
    
    var body: some View {
        
        ScrollViewReader { scrollView in
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                VStack(alignment: .leading) {
                    ForEach(objects) { object in
                        Text(object.line.text)
                            .frame(minWidth: 400, maxWidth: .infinity, maxHeight: 18, alignment: .leading)
                            .foregroundColor(Color(object.line.color))
                    }
                }
            }
            .onChange(of: objects.count, perform: { _ in
                scrollView.scrollTo(0, anchor: .topLeading)
            })
        }
        .font(.system(size: CGFloat(fontSize), weight: .regular, design: .monospaced))
    }
}

struct ObjectsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let mockObjects = [
            Object(id: 0, line: (UIColor.systemRed, "A RED object")),
            Object(id: 1, line: (UIColor.systemGreen, "A GREEN object")),
            Object(id: 2, line: (UIColor.systemBlue, "A BLUE object"))
        ]
        ObjectsView(objects: mockObjects, fontSize: 20)
            .environmentObject(Tester())
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
