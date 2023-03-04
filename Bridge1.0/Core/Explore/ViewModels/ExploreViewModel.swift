//
//  ExploreViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/3/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            
            print("DEBUG: Users \(users)")
        }
    }
}
