//
//  ColorsModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/29/23.
//

import Foundation

import FirebaseFirestoreSwift
import Firebase

struct ColorsModel: Identifiable, Decodable {
    @DocumentID var id: String?
    let favoriteColor: String
//    let blue: Double
//    let green: Double
//    let red: Double
//    let uid: String
}
