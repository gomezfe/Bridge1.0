//
//  TextArea.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/24/23.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeholder: String
    
    //Initialize binding
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
        UITextView.appearance().backgroundColor = .clear
       }
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            TextEditor(text: $text)
                .padding(4)
                .padding(.horizontal, 0)
                .padding(.vertical, 5)
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.horizontal,10)
                    .padding(.vertical)
            }
//            TextEditor(text: $text)
//                .padding(4)
        }
        .font(.body)
    }
}
