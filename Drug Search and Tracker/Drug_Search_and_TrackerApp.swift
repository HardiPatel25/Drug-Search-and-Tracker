//
//  Drug_Search_and_TrackerApp.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 21/04/25.
//

import SwiftUI
import Firebase

@main
struct Drug_Search_and_TrackerApp: App {
    /// Shared authentication view model across the app
    @StateObject var authVM = AuthViewModel()
    
    /// App initializer – configures Firebase when the app starts
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            // Inject the AuthViewModel into the environment so all views can access it
            ContentView()
                .environmentObject(authVM)
        }
    }
}
