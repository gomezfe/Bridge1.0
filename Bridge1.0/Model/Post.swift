//
//  Post.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/16/23.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
