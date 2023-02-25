//
//  AuthHeaderView.swift
//  Bridge1.0
//
//  Created by Felipe Gomez on 2/25/23.
//

import SwiftUI

struct AuthHeaderView: View {
    let title1: String
    let title2: String
    
    var body: some View {
        //Header view
        VStack(alignment: .leading) {
            //To strech the color to the screen width
            HStack { Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color("TealColor"))
        .foregroundColor(.white)
//        .clipShape(RoundedShape(corners: [.bottomRight]))
        
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome Back")
    }
}
