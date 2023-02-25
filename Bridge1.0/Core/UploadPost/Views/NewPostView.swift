//
//  NewPostView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/24/23.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var caption = ""

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    print("Post")
                } label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("TealColor"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("Make your post", text: $caption)

                  
            }
            .padding()
        }

    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
