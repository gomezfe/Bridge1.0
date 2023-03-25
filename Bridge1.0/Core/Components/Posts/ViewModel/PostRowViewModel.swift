//
//  PostRowViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/24/23.
//

import Foundation


class PostRowViewModel: ObservableObject {
    @Published var post: Post
    private let service = PostService()

    
    init(post: Post) {
        self.post = post
        checkIfUserLikePost()
    }
    
    func likePost() {
        service.likePost(post) {
            self.post.didLike = true
        }
    }
    
    
    func unlikePost() {
        service.unlikePost(post) {
            self.post.didLike = false
        }
    }
    func checkIfUserLikePost() {
        service.checkIfUserLikedPost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
}
