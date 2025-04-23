//
//  AuthViewModelTests.swift
//  Drug Search and TrackerTests
//
//  Created by Hardi Patel on 22/04/25.
//

import XCTest

import XCTest
@testable import Drug_Search_and_Tracker

final class AuthViewModelTests: XCTestCase {
    func testManualUserAssignment() {
        let viewModel = AuthViewModel()
        let mockUser = MockUser(uid: "abc123", email: "mock@test.com")

        viewModel.user = mockUser
        viewModel.isLoggedIn = true

        XCTAssertNotNil(viewModel.user)
        XCTAssertEqual(viewModel.user?.uid, "abc123")
        XCTAssertTrue(viewModel.isLoggedIn)
    }

    func testSignOut() {
        let viewModel = AuthViewModel()
        let mockUser = MockUser(uid: "abc123", email: "mock@test.com")
        viewModel.user = mockUser
        viewModel.isLoggedIn = true

        viewModel.signOut()

        XCTAssertNil(viewModel.user)
        XCTAssertFalse(viewModel.isLoggedIn)
    }
}

