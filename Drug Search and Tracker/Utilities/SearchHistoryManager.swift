//
//  SearchHistoryManager.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import Foundation

class SearchHistoryManager {
    // Singleton instance
    static let shared = SearchHistoryManager()
    
    // The key used to store and retrieve the search history
    private let key = "SearchHistoryKey"

    func load() -> [String] {
        UserDefaults.standard.stringArray(forKey: key) ?? []
    }

    func save(_ history: [String]) {
        UserDefaults.standard.set(history, forKey: key)
    }
}
