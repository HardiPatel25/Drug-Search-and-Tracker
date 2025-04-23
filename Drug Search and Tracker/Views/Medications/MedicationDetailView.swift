//
//  MedicationDetailView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI

struct MedicationDetailView: View {
    let med: Medication
    @Binding var medications: [Medication]
    @Binding var searchHistory: [String]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Image("icnTray")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.orange)

                Text(med.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                VStack {
                    Text("Details")
                        .font(.headline)
                    Text(med.details)
                        .font(.body)
                }
                .padding()

                Button(action: {
                    medications.append(med)
                    addToHistory(med.name)
                    dismiss()
                }) {
                    Text("Add Medication to List")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Details")
    }

    // Add the medication name to the search history
    private func addToHistory(_ name: String) {
        if !searchHistory.contains(name) {
            searchHistory.insert(name, at: 0)
            SearchHistoryManager.shared.save(searchHistory)
        }
    }
}
