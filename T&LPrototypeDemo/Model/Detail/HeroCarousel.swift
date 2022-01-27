//
//  HeroCarousel.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class HeroCarousel: Codable {
    let duration: String
    let heroItems: [Perk]

    enum CodingKeys: String, CodingKey {
        case duration
        case heroItems = "itineraries"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.duration = try values.decode(String.self, forKey: .duration)
        let stringsOrPerks = try values.decode([String: StringOrPerk].self, forKey: .heroItems)
        self.heroItems = stringsOrPerks.values.compactMap({
            switch $0 {
            case .string:
                return nil
            case .perk(let perk):
                return perk
            }
        })
    }

    init(duration: String, heroItems: [Perk]) {
        self.duration = duration
        self.heroItems = heroItems
    }
}
