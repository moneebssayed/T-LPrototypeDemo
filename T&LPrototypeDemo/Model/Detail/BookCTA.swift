//
//  BookCTA.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class BookCTA: Codable {
    let subtitle, ctaNumber, title: String

    init(subtitle: String, ctaNumber: String, title: String) {
        self.subtitle = subtitle
        self.ctaNumber = ctaNumber
        self.title = title
    }
}
