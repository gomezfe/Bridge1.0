//
//  ProfilePhotoSelectorView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/26/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var isDismissing = false
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        NavigationView {
            VStack {
                AuthHeaderView(title1: "Setup your account",
                               title2: "Add a profile photo")
                
                if isDismissing {
                    ProgressView()
                        .frame(maxWidth: 30 , maxHeight: 30)
                        .background(Color .white)
                        .opacity(0.5)
                }
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    if let profileImage = profileImage {
                        profileImage
                            .resizable()
                            .modifier(ProfileImageModifier())
                    } else {
                        Image("AddPhoto")
                            .resizable()
                            .modifier(ProfileImageModifier())
                    }
                }
                .sheet(isPresented: $showImagePicker,
                       onDismiss: loadImage) {
                    ImagePicker(selectedImage: $selectedImage)
                }
                       .padding(.top, 44)
                
                if let selectedImage = selectedImage {
                    
                        Button {
                            viewModel.uploadProfileImage(selectedImage)
                           
                            isDismissing = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                                withAnimation {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
 
                            print("Button Clicked")
                            
                        } label: {
                            Text("Continue")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 340, height: 50)
                                .background(Color("TealColor"))
                                .clipShape(Capsule())
                                .padding()
                        }
                    
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}


 
