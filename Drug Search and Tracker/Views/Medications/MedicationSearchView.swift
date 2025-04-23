//
//  MedicationSearchView.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import SwiftUI

struct MedicationSearchView: View {
    @StateObject private var viewModel = DrugSearchViewModel()
    @Binding var medications: [Medication]
    @Binding var searchHistory: [String]

    @State private var selectedDrugName: String? = nil

    var body: some View {
        VStack {
            TextField("Search Medication", text: $viewModel.searchText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()

            if viewModel.isLoading {
                ProgressView("Searching...")
                    .padding()
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            } else if viewModel.drugs.isEmpty && !viewModel.searchText.isEmpty {
                Text("No results found.")
                    .foregroundColor(.gray)
                    .padding()
            }

            List(viewModel.drugs) { drug in
                Button {
                    selectedDrugName = drug.name
                } label: {
                    Text(drug.name)
                }
            }
            .listStyle(PlainListStyle())

            NavigationLink(
                destination: MedicationDetailView(
                    med: Medication(
                        name: selectedDrugName ?? "",
                        details: "No additional details available."
                    ),
                    medications: $medications,
                    searchHistory: $searchHistory
                ),
                tag: selectedDrugName ?? "",
                selection: $selectedDrugName
            ) {
                EmptyView()
            }
            .hidden()
        }
        .navigationTitle("Search Medication")
    }

}
