//
//  Drug.swift
//  Drug Search and Tracker
//
//  Created by Hardi Patel on 22/04/25.
//

import Foundation

struct Drug: Identifiable, Decodable {
    let id = UUID()
    let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}

struct DrugSearchResponse: Decodable {
    let drugGroup: DrugGroup
}

struct DrugGroup: Decodable {
    let conceptGroup: [ConceptGroup]?
}

struct ConceptGroup: Decodable {
    let conceptProperties: [ConceptProperty]?
}

struct ConceptProperty: Decodable {
    let name: String
}
