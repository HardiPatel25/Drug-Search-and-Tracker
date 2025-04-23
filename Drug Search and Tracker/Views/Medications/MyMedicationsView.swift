//
//  MyMedicationsView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI

struct MyMedicationsView: View {
    @State private var medications: [Medication] = []
    @State private var searchHistory: [String] = []
    @State private var showSearch = false

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(medications) { med in
                        HStack {
                            Image("icnTray")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)

                            VStack(alignment: .leading) {
                                Text(med.name)
                                    .font(.headline)                                
                            }
                            Spacer()

                            Button(action: {
                                deleteMedication(med)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }

                Button(action: {
                    showSearch = true
                }) {
                    Label("Search Medications", systemImage: "plus.circle")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle("My Medications")
            .onAppear {
                // Load search history and map them to medications when the view appears
                searchHistory = SearchHistoryManager.shared.load()
                medications = searchHistory.map {
                    Medication(name: $0, details: "No details")
                }
            }
            .navigationDestination(isPresented: $showSearch) {
                MedicationSearchView(medications: $medications, searchHistory: $searchHistory)
            }
        }
    }

    private func deleteMedication(_ med: Medication) {
        medications.removeAll { $0.id == med.id }
        searchHistory.removeAll { $0 == med.name }
        SearchHistoryManager.shared.save(searchHistory)
    }
}

#Preview {
    MyMedicationsView()
}
