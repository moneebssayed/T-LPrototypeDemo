//
//  ItineraryRootContainer.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class ItineraryRootContainer: Codable {
    let container: ItineraryContainer

    enum CodingKeys: String, CodingKey {
        case container
    }

    init(container: ItineraryContainer) {
        self.container = container
    }
}
