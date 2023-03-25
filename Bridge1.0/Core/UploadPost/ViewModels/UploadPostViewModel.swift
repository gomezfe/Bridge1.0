//
//  UploadPostViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 3/4/23.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    @Published var didUploadPost = false
    let service = PostService()
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                self.didUploadPost = true
            } else {
                //Show message to user
            }
        }
    }
}
