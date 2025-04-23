//
//  DrugSearchViewModel.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import Foundation
import Combine

class DrugSearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var drugs: [Drug] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] term in
                // If the search term is empty, clear the drug list.
                guard !term.isEmpty else {
                    self?.drugs = []
                    return
                }
                self?.fetchDrugs(searchTerm: term)
            }
            .store(in: &cancellables)
    }
    
    deinit {
        print("DrugSearchViewModel deallocated")
    }

    func fetchDrugs(searchTerm: String) {
        isLoading = true
        let baseURL = "https://rxnav.nlm.nih.gov/REST/drugs.json"
        guard let encodedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?name=\(encodedTerm)&tty=SBD") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode(DrugSearchResponse.self, from: data)
                print("---decoded" ,decoded)
                let names = decoded.drugGroup.conceptGroup?
                    .compactMap { $0.conceptProperties }
                    .flatMap { $0 }
                    .prefix(10)
                    .map { Drug(name: $0.name) } ?? []

                DispatchQueue.main.async {
                    self.drugs = Array(names)
                    self.isLoading = false
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }
}
