//
//  PostRowView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/23/23.
//

import SwiftUI
import Kingfisher

struct PostRowView: View {
    @ObservedObject var viewModel: PostRowViewModel
    
    init(post: Post) {
        self.viewModel = PostRowViewModel(post: post)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            //Profile image + user info = post
            if let user = viewModel.post.user {
                HStack(alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    //User info &  post caption
                    VStack(alignment: .leading, spacing: 4) {
                        //User  info
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline).bold()
                            
                            Text("@\(user.username)")
                                .foregroundColor(.gray)
                                .font(.caption)
                            
                            Text("2w")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        
                        //Post caption
                        
                        Text(viewModel.post.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
                
            }
            //Action buttons
            
            HStack {
                Button {
                    //actions goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    //actions goes here...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.post.didLike ?? false ?
                    viewModel.unlikePost() :
                    viewModel.likePost()
                } label: {
                    Image(systemName: viewModel.post.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundColor(viewModel.post.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    //actions goes here...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }

            }
            .padding()
            .foregroundColor(.gray)
            
            Divider()
        }
    }
}

