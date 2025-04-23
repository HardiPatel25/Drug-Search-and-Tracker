//
//  SignInView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI

struct SignInView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authVM: AuthViewModel
    @State private var showToast = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Create New Account")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.blue)
                .padding(.top, 40)

            Group {
                TextField("Name", text: $name)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)

                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)

                SecureField("Create a password", text: $password)
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }

            Spacer()

            Button(action: {
                authVM.signUp(email: email, password: password)
            }) {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
        }
        .padding()
        
        if let toastMessage = authVM.toastMessage {
            ToastView(message: toastMessage)
                .onAppear {
                    showToast = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            authVM.toastMessage = nil
                            showToast = false
                        }
                    }
                }
                .zIndex(1)
        }
    }
}
#Preview {
    SignInView()
}
