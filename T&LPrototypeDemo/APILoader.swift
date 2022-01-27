//
//  Networking.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

import Foundation

final class APILoader {
        
    private static let apiURL = URL(string: "https://dev-go.travelandleisure.com/poc/jcr:content.10.json")!
    
    private static let detailsURL = URL(string: "https://dev-go.travelandleisure.com/poc/charleston/jcr:content.10.json")!
    
    static func fetchPage() async throws -> Page {
        let (data, _) = try await URLSession.shared.data(from: APILoader.apiURL)
        
        let page = try JSONDecoder().decode(Page.self, from: data)
        return page
    }
        
    static func fetchDetails() async throws -> ItineraryDetails {
        let (data, _) = try await URLSession.shared.data(from: APILoader.detailsURL)
        
        let details = try JSONDecoder().decode(ItineraryDetails.self, from: data)
        return details
    }
    
    static func createFullURL(path: String) -> URL? {
        URL(string: "https://dev-go.travelandleisure.com" + path)
    }
}

final class DataCache {
    static private var slideCache: [String: Slide] = [:]
    
    static subscript(fileReference: String) -> Slide? {
        get {
            DataCache.slideCache[fileReference]
        }
        set {
            DataCache.slideCache[fileReference] = newValue
        }
    }
}
