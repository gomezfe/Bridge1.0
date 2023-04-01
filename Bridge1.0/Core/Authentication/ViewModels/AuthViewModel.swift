//
//  AuthViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/25/23.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    @Published var BackgoundUIColor: ColorsModel?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service =  UserService()
    private let colorService = ColorService()
    
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        self.fectchColor()
//        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.tempUserSession = user
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthenticateUser = true
                }
            

        }
    }
    
    func signOut() {
        userSession = nil 
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
            
    func uploadBackgroundColor(color: Color) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        let collectionRef = db.collection("colors")
        
        
        let components = color.cgColor?.components!
                
                let r = Float(components?[0] ?? 216)
                let g = Float(components?[1] ?? 584)
                let b = Float(components?[2] ?? 741)
                
                let hexColor = String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))

        
//
//        if UIColor(color) != nil{
//            var uiColor = UIColor(color)
//
//            var red: CGFloat = 0
//            var green: CGFloat = 0
//            var blue: CGFloat = 0
//            var alpha: CGFloat = 0
//
//            uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
//
//            let data : [String: Any] = [
//                "uid": uid,
//                "red": Double(red),
//                "green": Double(green),
//                "blue": Double(blue)
//            ]
            
            collectionRef.getDocuments { document, error in
//                    if document!.count > 0 {
                        print("DEBUG: A document has been found \(document?.count)")
                        
                        let userLikesRef = Firestore.firestore().collection("colors").document(uid)
                        
                        Firestore.firestore().collection("colors").document(uid)
                    .setData(["favoriteColor": hexColor], merge: true)
                        
//                    } else {
//                        print("DEBUG: A document has not been found")
//
//                        Firestore.firestore().collection("colors").document(uid)
//                            .setData(["favoriteColor": hexColor], merge: true) { error in
//                                if let error = error {
//                                    print("DEBUG: Failed to upload color with error: \(error.localizedDescription)")
//                                    return
//                                }
//                            }

//                    }
                }
//        }
        
    }
    
    func fectchColor() {
        guard let uid = self.userSession?.uid else { return }

        colorService.fetchColors(withUid: uid) { color in
            self.BackgoundUIColor = color
        }
    }
    
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let g = Double((rgbValue & 0xff00) >> 8) / 255.0
        let b = Double(rgbValue & 0xff) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
