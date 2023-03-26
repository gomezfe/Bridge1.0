//
//  ColorService.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/25/23.
//

import Foundation

//
//struct ColorService {
//
//    func uploadPost(caption: String, completion: @escaping(Bool) -> Void) {
//        guard let uid = Auth.auth().currentUser?.uid else { return }
//
//        let data = ["uid": uid,
//                    "caption": caption,
//                    "likes": 0,
//                    "timestamp": Timestamp(date: Date())] as [String : Any]
//
//        Firestore.firestore().collection("posts").document()
//            .setData(data) { error in
//                if let error = error {
//                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
//                    completion(false)
//                    return
//            }
//        completion(true)
//        }
//    }
//
//    func fetchPost(completion: @escaping([Post]) -> Void) {
//        Firestore.firestore().collection("posts")
//            .order(by: "timestamp", descending: true)
//            .getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            let post = documents.compactMap({ try? $0.data(as: Post.self) })
//            completion(post)
//
//        }
//    }
//}
