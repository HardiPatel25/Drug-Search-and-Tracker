//
//  AuthViewModel.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    private let auth: Auth
    @Published var user: UserRepresentable?
    @Published var isLoggedIn = false
    @Published var toastMessage: String?

    /// Initializes the AuthViewModel.
    /// - Parameter auth: The Firebase Auth instance.
    init(auth: Auth = Auth.auth()) {
        self.auth = auth
        self.user = Auth.auth().currentUser
        self.isLoggedIn = user != nil
    }

    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.toastMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
            self?.isLoggedIn = true
            self?.toastMessage = "Account created successfully!"
        }
    }

    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                self?.toastMessage = error.localizedDescription
                return
            }
            self?.user = result?.user
            self?.isLoggedIn = true
            self?.toastMessage = "Logged In successfully!"
        }
    }

    func signOut() {
        try? auth.signOut()
        self.user = nil
        self.isLoggedIn = false
    }
}

protocol UserRepresentable {
    var uid: String { get }
    var email: String? { get }
}

extension User: UserRepresentable {}
