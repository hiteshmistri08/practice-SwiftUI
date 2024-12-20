//
//  ForgetPasswordView.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 31/10/24.
//

import SwiftUI

struct ForgetPasswordView: View {
    @Environment(\.dismiss) var dismiss

    @State private var email: String = ""
    @State private var isDisableEmailButton: Bool = true
    @FocusState private var emailIsFocused: Bool

    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 50, height: 58)
                .scaledToFill()
                .padding()
            
            VStack(alignment: .leading, spacing: 16.0) {
                HStack(spacing: 5.0) {
                    TextField("Enter your email id here...", text: $email)
                        .textFieldStyle(.plain)
                        .keyboardType(.emailAddress)
                        .focused($emailIsFocused)
                        .onChange(of: email) { newValue in
                            isDisableEmailButton = !newValue.isValidEmail
                        }
                    ArrowRightCircleBurron(isDisable: isDisableEmailButton) {
                        emailIsFocused = false
                        dismiss()
                    }
                }
                .padding()
                .roundedRectengleOverlay()
            }
            .padding()
        }
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
