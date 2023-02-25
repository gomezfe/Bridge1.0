//
//  FeedView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/22/23.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewPostView = false
    var body: some View {

        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 20, id: \.self) { _ in
                        PostRowView()
                            .padding()
                    }
                }
            }
            Button {
                showNewPostView.toggle()
            } label: {
                Image(systemName: "arrow.up.message.fill")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
            }.background(Color("TealColor"))
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewPostView) {
                    NewPostView()
                }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
 
