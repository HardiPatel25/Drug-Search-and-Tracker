//
//  MockUser.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI
import Foundation
import FirebaseAuth

/// A mock implementation of the UserRepresentable protocol for testing .
struct MockUser: UserRepresentable {
    var uid: String
    var email: String?
}
