//
//  ToastView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import Foundation
import SwiftUI

struct ToastView: View {
    var message: String

    var body: some View {
        Text(message)
            .foregroundColor(.white)
            .padding()
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 10)
            .transition(.move(edge: .top).combined(with: .opacity))
            .animation(.easeInOut, value: message)
    }
}
