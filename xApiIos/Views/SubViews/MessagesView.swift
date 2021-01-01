//
//  MessagesView.swift
//  xApiIos
//
//  Created by Douglas Adams on 7/28/20.
//  Copyright © 2020 Douglas Adams. All rights reserved.
//

import SwiftUI

struct MessagesView: View {
    let messages        : [Message]
    let showTimestamps  : Bool
    let fontSize        : Int
    
    func showTimestamps(text: String) -> String {
        if showTimestamps {
            return text
        } else {
            return String(text.dropFirst(9))
        }
    }
    
    func lineColor(_ text: String) -> Color {
        var color = Color(.label)
        
        let base = text.dropFirst(9)
        if base.prefix(1) == "C" { color = Color(.systemGreen) }
        if base.prefix(1) == "R" && base.contains("|0|") { color = Color(.systemGray) }
        if base.prefix(1) == "R" && !base.contains("|0|") { color = Color(.systemRed) }
        if base.prefix(2) == "S0" { color = Color(.systemOrange) }
                
        return color
    }
    
    var body: some View {
        
        ScrollViewReader { scrollView in
            ScrollView([.horizontal, .vertical], showsIndicators: true) {
                VStack (alignment: .leading) {
                    ForEach(messages) { message in
                        Text(showTimestamps(text: message.text))
                            .padding(.leading, 5)
                            .frame(minWidth: 400, maxWidth: .infinity, maxHeight: 18, alignment: .leading)
                            .foregroundColor( lineColor(message.text) )
                    }
                }
            }
            .onChange(of: messages.count, perform: { _ in
                scrollView.scrollTo(messages.count+1, anchor: .bottomLeading)
            })
        }.font(.system(size: CGFloat(fontSize), weight: .regular, design: .monospaced))
    }
}

struct MessagesView_Previews: PreviewProvider {
    
    static var previews: some View {
        let mockMessages = [
            Message(id: 0, text: "11:40:04 C  The first message"),
            Message(id: 1, text: "11:40:05 R  The second message"),
            Message(id: 2, text: "11:40:06 S0 The third message"),
            Message(id: 3, text: "11:40:07    The fourth message")
        ]
        MessagesView(messages: mockMessages, showTimestamps: true, fontSize: 20)
            .previewLayout(.fixed(width: 2160 / 2.0, height: 1620 / 2.0))
    }
}
