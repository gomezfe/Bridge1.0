//
//  FeedView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/22/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {

        ScrollView {
            LazyVStack {
                ForEach(0 ... 20, id: \.self) { _ in
                    PostRowView()
                        .padding()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
 
