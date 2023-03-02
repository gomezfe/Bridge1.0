//
//  UserService.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/2/23.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
//    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
//        Firestore.firestore().collection("users")
//            .document(uid)
//            .getDocument { snapshot, _ in
//                guard let snapshot = snapshot else { return }
//
//                guard let user = try? snapshot.data(as: User.self) else { return }
//                completion(user)
//
////                print("DEBUG: Username is \(user.username)")
////                print("DEBUG: Email is \(user.email)")
//            }
//}

    
//    func fetchUser(withUid uid: String) {
//
//        let db = Firestore.firestore()
//        let userRef = db.collection("users").document(uid)
//
//        userRef.getDocument { (document, error) in
//            if let document =  document, document.exists {
//        // Convert document data to UserModel object
//
//                do{
//
//                    let data = try document.data(as: User.self)
//                    print("DEBUG: User data from USerService is \(data.username)")
//                    print("DEBUG: User data from USerService is \(data.email)")
//
////                    print("DEBUG: User data is \(data)")
//                } catch {
//                    print("Error decoding user data: \(error.localizedDescription)")
//
//                }
//            }
//        }
//
//    }

    
    func fetchUser(withUid uid: String, completion: @escaping (User?) -> Void) {

        let db = Firestore.firestore()
        let userRef = db.collection("users").document(uid)

        userRef.getDocument { (document, error) in
            if let document =  document, document.exists {
        // Convert document data to UserModel object
                do {
                    let data = try document.data(as: User.self)
                    print("DEBUG: User data from USerService is \(data)")
//                    print("DEBUG: User data from USerService is \(data.username)")
//                    print("DEBUG: User data from USerService is \(data.username)")
                    completion(data)
                } catch {
                    print("Error decoding user data: \(error.localizedDescription)")
                    completion(nil)
                }
            } else {
                    print("User does not exist")
                    completion(nil)
            }
        }

    }

//func fetchUser(withID uid: String, completion: @escaping (UserModel?) -> Void) {
//    let db = Firestore.firestore()
//    let userRef = db.collection("users").document(uid)
//
//    userRef.getDocument { (document, error) in
//        if let document = document, document.exists {
//            // Convert document data to UserModel object
//            do {
//                let data = try document.data(as: UserModel.self)
//                print("DEBUG: USer data from USerService is: \(data) ")
//                completion(data)
//            } catch {
//                print("Error decoding user data: \(error.localizedDescription)")
//                completion(nil)
//            }
//        } else {
//            print("User does not exist")
//            completion(nil)
//        }
//    }
}
