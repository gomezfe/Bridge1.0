//
//  User.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/2/23.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
