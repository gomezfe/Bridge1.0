//
//  ContentView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/22/23.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            //no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                // have a logged in user
                ZStack(alignment: .topLeading) {
                    MainTabView()
                        .navigationBarHidden(showMenu)
                    
                    if showMenu {
                        ZStack {
                            Color(.black)
                                .opacity(showMenu ? 0.25 : 0.0)
                        }.onTapGesture {
                            withAnimation(.easeInOut) {
                                showMenu = false
                            }
                        }
                        .ignoresSafeArea()
                    }
                    
                    SideMenuView()
                        .frame(width: 300)
                        .offset(x: showMenu ? 0 : -300, y: 0)
                        .background(showMenu ? Color.white : Color.clear)
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        if let user = viewModel.currentUser {
                            Button {
                                //Makes the side menu toggle in/out
                                withAnimation(.easeInOut) {
                                    showMenu.toggle()
                                }
                            } label: {
                                //Side menu circle (Click to show side menu)
//                                Circle()
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 32, height: 32)
                                    .clipShape(Circle())
                            }
                        }

                    }
                }
                .onAppear {
                    showMenu = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
