//
//  ItineraryContainer.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class ItineraryContainer: Codable {
    let heroCarousel: HeroCarousel
    let editorProfile: EditorProfile
    let bookCTA: BookCTA
    let costOverview: CostOverview

    enum CodingKeys: String, CodingKey {
        case heroCarousel = "herocarousel"
        case bookCTA = "bookcta"
        case editorProfile = "editorprofile"
        case costOverview = "costoverview_1066359888"
    }

    init(heroCarousel: HeroCarousel, editorProfile: EditorProfile, bookCTA: BookCTA, costOverview: CostOverview) {
        self.heroCarousel = heroCarousel
        self.editorProfile = editorProfile
        self.bookCTA = bookCTA
        self.costOverview = costOverview
    }
}
