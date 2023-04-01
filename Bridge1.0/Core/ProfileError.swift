//
//  ProfileError.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/31/23.
//

import SwiftUI

struct ProfileError: View {
    var body: some View {
        VStack{
            NavigationView {
                ZStack{
                    
                    Color("TealColor")
                        .cornerRadius(30)
                        .frame(width: 340, height: 200)
                    
                    VStack {
                        HStack{
                            Text("An Error Ocurred, Sorry for the inconvenience, please loging again.")
                                .frame(width: 300, height: 350)
                                .offset(x:30, y: -30)
                                .scaledToFill()
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                            
                            NavigationLink {
                                LoginView()
                                
                            } label: {
                                Text("LogIn")
                                    .frame(width: 50, height: 16)
                                    .foregroundColor(.white)
                            }
                            .offset(x:-150, y: 35)
                            .fontWeight(.heavy)
                            
                            
                        }
                        
                    }
                    .navigationBarHidden(true)
                }
            }
        }
    }
}

struct ProfileError_Previews: PreviewProvider {
    static var previews: some View {
        ProfileError()
    }
}
