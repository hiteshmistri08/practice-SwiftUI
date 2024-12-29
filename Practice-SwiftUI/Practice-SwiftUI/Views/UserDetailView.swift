//
//  UserDetailView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 29/12/24.
//

import SwiftUI

struct UserDetailView: View {
    let user: UserResponse.User
    
    var body: some View {
        VStack {
            AsyncCachedImage(url: URL(string: user.avatar)) { image in
                image
                    .resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .cornerRadius(60)
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: -")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    Text(user.fullName)
                        .font(.title2)
                }
                HStack {
                    Text("Email: -")
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                    Text(user.email)
                        .font(.title2)
                }
            }
            .padding()
            Spacer()
        }
    }
}
/*
struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
*/
