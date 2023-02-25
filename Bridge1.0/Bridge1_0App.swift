//
//  Bridge1_0App.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/22/23.
//

import SwiftUI
import Firebase

@main
struct Bridge1_0App: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //Adds a navigation bar to the entire app
            NavigationView {
//                ContentView()
                LoginView()
            }
        }
    }
}
