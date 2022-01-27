//
//  ItineraryDetails.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

// MARK: - ItineraryDetails
class ItineraryDetails: Codable {
    let subtitle: String
    let pageTitle: String
    let root: ItineraryRoot

    enum CodingKeys: String, CodingKey {
        case subtitle
        case pageTitle
        case root
    }

    init(subtitle: String, pageTitle: String, root: ItineraryRoot) {
        self.subtitle = subtitle
        self.pageTitle = pageTitle
        self.root = root
    }
}
