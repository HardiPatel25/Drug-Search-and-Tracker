//
//  WelcomeView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI

struct WelcomeView: View {
    @State private var goToSignUp = false
    @State private var goToLogin = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("Catalog")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                
                Spacer()
                
                VStack(spacing: 10) {
                    Button(action: {
                        goToSignUp = true
                       
                    }) {
                        Text("Create New Account")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        goToLogin = true
                        
                    }) {
                        Text("I already have an account")
                            .foregroundColor(.blue)
                            .font(.footnote)
                    }
                    
                    NavigationLink(destination: SignInView(), isActive: $goToSignUp) {
                        EmptyView()
                    }
                    
                    NavigationLink(destination: LoginView(), isActive: $goToLogin) {
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.sRGB, red: 224/255, green: 234/255, blue: 255/255, opacity: 1.0))
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WelcomeView()
}
