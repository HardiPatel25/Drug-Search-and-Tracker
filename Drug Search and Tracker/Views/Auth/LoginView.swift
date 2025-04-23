//
//  LoginView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var goToMedication = false
    @EnvironmentObject var authVM: AuthViewModel
    @State private var showToast = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                    .padding(.top, 40)
                
                Group {
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
                    authVM.signIn(email: email, password: password)
                }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom, 30)
                
                NavigationLink(destination: MyMedicationsView(), isActive: $goToMedication) {
                    EmptyView()
                }
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
                                if authVM.isLoggedIn {
                                    goToMedication = true
                                }
                            }
                        }
                    }
                    .zIndex(1)  // Using this toast message is shown above other UI elements
            }
        }
    }
}

#Preview {
    LoginView()
}
