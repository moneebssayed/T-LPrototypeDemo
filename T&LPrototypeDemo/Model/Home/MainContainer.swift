//
//  PurpleContainer.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

class MainContainer: Codable {
    let contentContainer: ContentContainer

    enum CodingKeys: String, CodingKey {
        case contentContainer = "container_239815453"
    }

    init(contentContainer: ContentContainer) {
        self.contentContainer = contentContainer
    }
}
