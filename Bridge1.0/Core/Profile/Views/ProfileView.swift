//
//  ProfileView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/23/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var mode

    var body: some View {
        VStack{
            NavigationView {
                ZStack {
                    Color("TealColor")
                        .cornerRadius(30)
                        .frame(width: 340, height: 500)
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
                            }.offset(x:-120, y:-45)
                            
                            Image(systemName: "bell.badge")
                                .font(.title)
                                .padding(6)
                                .overlay(Circle().stroke(Color.black, lineWidth: 0.75))
                                .offset(x:120, y: -45)
                        }
                        HStack {
                            Text("User Full Name")
                                .font(.title2).bold()
                                .offset(y:-80)
                        }
                        Circle()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 150, height: 150)
                            .offset(y: -70)
                        
                        //TODO: Destination to be updated
                        NavigationLink(destination: PostRowView()) {
                            Text("Change Profile Photo")
                        }
                        .font(.headline)
                        .foregroundColor(Color(.black))
                        .frame(width: 200, height: 30)
                        .background(Color(.white))
                        .clipShape(Capsule())
                        .padding()
                        .offset(y: -85)
                        
                        //TODO: To be updated to initialize user statsView
                        UserStatsView()
                            .offset(y: -80)
                        
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                                Text("The Moon, Universe")
                        }
                        .offset(y: -50)
                        .font(.caption)
                        
                        Text("Dream Big, make it happen")
                            .offset(y: -40)

                        Text("@user.fullname")
                            .font(.subheadline)
                            .offset(y: 40)
                    }
                }
            }.navigationBarHidden(true)
            Spacer()
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
