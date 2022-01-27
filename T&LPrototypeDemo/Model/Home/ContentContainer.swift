//
//  ContentContainer.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

// MARK: - Container239815453
class ContentContainer: Codable {
    let curatedItinerary: CuratedItinerary

    enum CodingKeys: String, CodingKey {
        case curatedItinerary = "curateditinerary_2114802142"
    }

    init(curatedItinerary: CuratedItinerary) {
        self.curatedItinerary = curatedItinerary
    }
}
