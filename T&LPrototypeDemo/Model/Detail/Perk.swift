//
//  Perk.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class Perk: Codable, Identifiable {
    let id = UUID()
    let jcrTitle, fileReference: String
    let bestBadge: String?
    var fullImageURL: URL? {
        APILoader.createFullURL(path: fileReference.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? fileReference)
    }
    
    enum CodingKeys: String, CodingKey {
        case jcrTitle = "jcr:title"
        case fileReference
        case bestBadge
    }

    init(jcrTitle: String, fileReference: String, bestBadge: String?) {
        self.jcrTitle = jcrTitle
        self.fileReference = fileReference
        self.bestBadge = bestBadge
    }
}
