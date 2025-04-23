//
//  Medication.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import Foundation

struct Medication: Identifiable {
    let id = UUID()
    let name: String
    let genericName: String? = ""
    let details: String
    let icon: String? = ""
}
