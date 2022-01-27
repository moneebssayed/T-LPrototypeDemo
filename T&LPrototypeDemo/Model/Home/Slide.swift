//
//  Slide.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

import Foundation

public class Slide: Codable, Identifiable, Comparable {
    public let id = UUID()
    let duration: String
    let fileReference: String
    let headline: String
    let link: String?
    let tags: [String]?
    let title: String

    var fullImageURL: URL? {
        APILoader.createFullURL(path: fileReference.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? fileReference)
    }

    enum CodingKeys: String, CodingKey {
        case duration, fileReference
        case headline, link, tags, title
    }

    init(duration: String, fileReference: String, headline: String, link: String?, tags: [String]?, title: String) {
        self.duration = duration
        self.fileReference = fileReference
        self.headline = headline
        self.link = link
        self.tags = tags
        self.title = title
    }
    
    public static func == (lhs: Slide, rhs: Slide) -> Bool {
        lhs.title == rhs.title
//        lhs.fileReference == rhs.fileReference &&
//        lhs.duration == rhs.duration &&
//        lhs.headline == rhs.headline &&
//        lhs.link == rhs.link &&
//        lhs.tags == rhs.tags
    }
    
    public static func < (lhs: Slide, rhs: Slide) -> Bool {
        lhs.title < rhs.title
    }
}
