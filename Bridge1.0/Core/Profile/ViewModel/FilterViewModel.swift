//
//  FilterViewModel.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/23/23.
//

import Foundation

enum FilterViewModel: Int, CaseIterable {
    case userPost
    case replies
    case likes
    
    var title: String {
        switch self {
        case .userPost: return "Post"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
