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
    @State private var bgColor = Color.red
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack{
                NavigationView {
                    ZStack {
//                        Color("TealColor")
                        bgColor
                            .cornerRadius(30)
                            .frame(width: 340, height: 500)
                        VStack {
                            HStack{
                                Button {
                                    print("arrow left press")
                                    authViewModel.uploadBackgroundColor(color: bgColor)
                                    mode.wrappedValue.dismiss()
                                } label: {
                                    Image(systemName: "arrow.left")
                                        .resizable()
                                        .frame(width: 20, height: 16)
                                        .foregroundColor(.white)
                                }.offset(x:-60, y:-45)
                                
                                ColorPicker("Background Color", selection: $bgColor)
                                    .frame(width: 130, height: 130)
                                    .padding(6)
                                    .offset(x:70, y: -45)
                            }
                            HStack {
                                Text(user.fullname)
                                    .font(.title2).bold()
                                    .offset(y:-80)
                            }
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .offset(y: -70)
                            
                            //TODO: Destination to be updated
//                            NavigationLink(destination: PostRowView()) {
//                                Text("Change Profile Photo")
//                            }
//                            .font(.headline)
//                            .foregroundColor(Color(.black))
//                            .frame(width: 200, height: 30)
//                            .background(Color(.white))
//                            .clipShape(Capsule())
//                            .padding()
//                            .offset(y: -85)
//                            
                            //TODO: To be updated to initialize user statsView
                            UserStatsView()
                                .offset(y: -60)
                            
                            HStack{
                                Image(systemName: "mappin.and.ellipse")
                                Text("The Moon, Universe")
                            }
                            .offset(y: -50)
                            .font(.caption)
                            
                            Text("Dream Big, make it happen")
                                .offset(y: -40)
                            
                            Text("@\(user.username)")
                                .font(.subheadline)
                                .offset(y: 20)
                        }
                    }
                }.navigationBarHidden(true)
                Spacer()
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
