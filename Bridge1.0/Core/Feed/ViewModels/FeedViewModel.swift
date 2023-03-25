//
//  FeedViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/16/23.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    let service = PostService()
    let userService = UserService()
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
            service.fetchPost { posts in
                self.posts = posts
                
                for i in 0 ..< posts.count {
                    let uid = posts[i].uid
                
                    self.userService.fetchUser(withUid: uid) { user in
                        self.posts[i].user = user
                }
            }
        }
    }
}

