//
//  ColorService.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/25/23.
//

import Firebase

struct ColorService {
    
//    func fetchColors(withUid uid: String, completion: @escaping (User?) -> Void) {
//
//        let db = Firestore.firestore()
//        let userRef = db.collection("colors").document(uid)
//
//        userRef.getDocument { (document, error) in
//            if let document =  document, document.exists {
//                // Convert document data to UserModel object
//                do {
//                    let data = try document.data(as: User.self)
//                    print("DEBUG: User data from USerService is \(data)")
//                    print("DEBUG: User data from USerService is \(data.username)")
//                    print("DEBUG: User data from USerService is \(data.username)")
//                    completion(data)
//                } catch {
//                    print("Error decoding user data: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            } else {
//                print("User does not exist")
//                completion(nil)
//            }
//        }
//
//    }
    
//    func fetchColors(withUid uid: String, completion: @escaping (ColorsModel?) -> Void) {
//
//        let db = Firestore.firestore()
//        let userRef = db.collection("colors").document(uid)
//
//        userRef.getDocument { (document, error) in
//            if let document =  document, document.exists {
//                // Convert document data to UserModel object
//                do {
//                    let data = try document.data(as: ColorsModel.self)
//                    print("DEBUG: User data from COLORSERVICE is \(data.red)")
//                    completion(data)
//
//                } catch {
//                    print("Error decoding Color data: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            } else {
//                print("Color does not exist")
//                completion(nil)
//            }
//        }
//
//    }
    
    
    func fetchColors(withUid uid: String, completion: @escaping (ColorsModel?) -> Void) {
        
        let db = Firestore.firestore()
        let userRef = db.collection("colors").document(uid)
        
        userRef.getDocument { (document, error) in
            if let document =  document, document.exists {
                // Convert document data to UserModel object
                do {
                    let data = try document.data(as: ColorsModel.self)
                    print("DEBUG: User data from COLORSERVICE is \(data.favoriteColor)")
                    completion(data)
               
                } catch {
                    print("Error decoding Color data: \(error.localizedDescription)")
                    completion(nil)
                }
            } else {
                print("Color does not exist")
                completion(nil)
            }
        }
        
    }
}

