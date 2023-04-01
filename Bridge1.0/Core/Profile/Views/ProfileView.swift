//
//  ProfileView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/23/23.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authViewModel: AuthViewModel
    var ColorTemp: Color?
    @State private var bgColor: Color = Color("TealColor")
    @State private var showColorPicker = false
    
    var body: some View {
        VStack {
        ZStack {
            if let user = authViewModel.currentUser {
                backgroundViewWithColor
            } else {
                ProfileError()
                }
            
            }
        
        }
        .sheet(isPresented: $showColorPicker) {
            VStack {
                ColorPicker("Change the Color of the app", selection: $bgColor)
                   
                    .frame(width: 300, height: 300)
                    .onDisappear {
                        authViewModel.uploadBackgroundColor(color: bgColor)
                        authViewModel.fectchColor()
                    }
            }.background(content: {
                bgColor
                     .frame(width: 400, height: 400)
                     .cornerRadius(30)
                     
             })
        }
//        .onDisappear {
//            bgColor
//                 .frame(width: 400, height: 400)
//                 .cornerRadius(30)
//        }
        
    }
      
    
    func loadWithColor() {
        if let colores = authViewModel.BackgoundUIColor {
            
            let colorTemp = Color(hex: colores.favoriteColor)
            bgColor = colorTemp
        }
        authViewModel.fectchColor()
    }
    
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}


extension ProfileView {
    
    var backgroundViewWithColor: some View {
        ZStack {
            if let user = authViewModel.currentUser {
                VStack{
                    NavigationView {
                        ZStack{
                            
                            
//                            if let color = authViewModel.BackgoundUIColor {
                                
                                VStack {
                                    HStack{
                                        Button {
                                            print("arrow left press")
                                            
                                            mode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "arrow.left")
                                                .resizable()
                                                .frame(width: 20, height: 16)
                                                .foregroundColor(.white)
                                        }
                                    }.offset(x:-130, y: -250)
                                    
                                }
                                
                                
//                            if let color = authViewModel.BackgoundUIColor {
                                
                                Button("Change App Color") {
                                    
                                    showColorPicker = true
                                }
                                
                                .frame(width: 150, height: 150)
                                .padding(6)
                                .offset(x:80, y: -250)
                                
//                            }
                                    HStack {
                                    
                                        Text(user.fullname)
                                            .font(.title2).bold()
                                            .offset(y:0)
                                    }
                                    KFImage(URL(string: user.profileImageUrl))
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .frame(width: 150, height: 150)
                                        .offset(y: -120)
                                    
                                    UserStatsView()
                                        .offset(y: 100)
                                    
                                    HStack{
                                        Image(systemName: "mappin.and.ellipse")
                                        Text("The Moon, Universe")
                                    }
                                    .offset(y: 150)
                                    .font(.caption)
                                    
                                    Text("Dream Big, make it happen")
                                        .offset(y: 200)
                                    
                                    Text("@\(user.username)")
                                        .font(.subheadline)
                                        .offset(y: 250)
//                                }
                            
                        }
                        .background(content: {
                            if (authViewModel.BackgoundUIColor != nil) {
                                bgColor
                                    .frame(width: 600, height: 600)
                            } else {
                                Color("TealColor")
                                    .frame(width: 600, height: 600)
                            }
                        })
                        .navigationBarHidden(true)
                        Spacer()
                    }
                }
                .frame(width: 340, height: 600)
                    .cornerRadius(30)

                    
                .onAppear{
                    loadWithColor()
                }
            }
        }
    }
}

