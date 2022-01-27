//
//  ItineraryRoot.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

// MARK: - Root
class ItineraryRoot: Codable {
    let container: ItineraryRootContainer?

    enum CodingKeys: String, CodingKey {
        case container
    }

    init(container: ItineraryRootContainer?) {
        self.container = container
    }
}
