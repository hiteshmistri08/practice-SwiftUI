//
//  LoginView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 13/10/24.
//

import SwiftUI

struct LoginView: View {

    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isDisableEmailButton: Bool = true
    @State private var isHiddenEmailButton: Bool = false
    @State private var canShowPasswordField: Bool = false
    @State private var isDisablePasswordButton: Bool = true
    
    @State private var presentForgetPassword: Bool = false
    @State var isLinkActive = false

    var body: some View {
        NavigationStack {
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
                                isDisableEmailButton = !newValue.trimmingCharacters(in: .whitespaces).isValidEmail
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
                            NavigationLink(destination: UserListView(), isActive: $isLinkActive) {
                                ArrowRightCircleBurron(isDisable: isDisablePasswordButton) {
                                    isLinkActive = true
                                    debugPrint("Login Successfully")
                                }
                            }
                        }
                        .padding()
                        .roundedRectengleOverlay()
                        
                        HStack {
                            Spacer()
                            Button {
                                debugPrint("Forgot button clicked")
                                presentForgetPassword = true
                            } label: {
                                Text("Forget Password?")
                            }
                            .sheet(isPresented: $presentForgetPassword, onDismiss: {
                                presentForgetPassword = false
                            }) {
                                NavigationStack {
                                    ForgetPasswordView()
                                        .navigationTitle("Forget Password")
                                    
                                }
                                .presentationDetents([.medium])
                                
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
