//
//  CreateLoginView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 13/10/24.
//

import SwiftUI

struct CreateLoginView: View {

    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isDisableEmailButton: Bool = true
    @State private var isHiddenEmailButton: Bool = false
    @State private var canShowPasswordField: Bool = false
    @State private var isDisablePasswordButton: Bool = true

    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 50, height: 58)
                .scaledToFill()
            Text("Welcome to Apple")
                .font(.callout)
                .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 16.0) {
                HStack(spacing: 5) {
                    TextField("Enter your email id here...", text: $userName)
                        .textFieldStyle(.plain)
                        .keyboardType(.emailAddress)
                        .onChange(of: userName) { newValue in
                            isDisableEmailButton = !newValue.isValidEmail
                            if newValue.isValidEmail == false {
                                canShowPasswordField = false
                                isHiddenEmailButton = false
                            }
                        }
                    if isHiddenEmailButton == false {
                        ArrowRightCircleBurron(isDisable: isDisableEmailButton) {
                            canShowPasswordField = true
                            isHiddenEmailButton = true
                        }
                    }
                }
                .padding()
                .roundedRectengleOverlay()
                
                if canShowPasswordField {
                    HStack(spacing: 5) {
                        SecureField("Enter password here...", text: $password)
                            .textFieldStyle(.plain)
                            .onChange(of: password) { newValue in
                                isDisablePasswordButton = !newValue.isValidPasswrod
                            }
                        ArrowRightCircleBurron(isDisable: isDisablePasswordButton) {
                            debugPrint("Login Successfully")
                        }
                    }
                    .padding()
                    .roundedRectengleOverlay()
                    
                    HStack {
                        Spacer()
                        Button {
                            debugPrint("Forgot button clicked")
                        } label: {
                            Text("Forget Password?")
                        }
                    }
                }
            }
            .padding()
        }
    }
}


struct CreateLoginView_Previews: PreviewProvider {
    static var previews: some View {
        CreateLoginView()
    }
}
