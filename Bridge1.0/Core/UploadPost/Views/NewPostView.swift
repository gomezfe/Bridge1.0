//
//  NewPostView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/24/23.
//

import SwiftUI
import Kingfisher

struct NewPostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var caption = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadPostViewModel()

    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadPost(withCaption: caption)
                } label: {
                    Text("Post")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color("TealColor"))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                
                if let user = authViewModel.currentUser {
//                    Circle()
                KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                }
                TextArea("Make your post", text: $caption)

                  
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadPost) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
