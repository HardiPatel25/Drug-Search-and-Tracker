//
//  Drug_Search_and_TrackerApp.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 21/04/25.
//
import SwiftUI

struct ContentView: View {
    /// AuthViewModel is responsible for managing authentication state
    @StateObject var authVM = AuthViewModel()

    var body: some View {
        // Show main app view if user is logged in
        if authVM.isLoggedIn {
            MyMedicationsView()
                .environmentObject(authVM)  // Pass auth state to child views
        } else {
            // Show onboarding/login screen if user is not logged in
            WelcomeView()
                .environmentObject(authVM) // Pass auth state to child views
        }
    }
}
