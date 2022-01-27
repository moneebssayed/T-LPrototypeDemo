//
//  CuratedItinerary.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

class CuratedItinerary: Codable {
    let slides: [Slide]
    let description, title: String
    
    enum CodingKeys: String, CodingKey {
        case slides
        case description = "copy"
        case title = "title"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        let stringsOrSlides = try values.decode([String: StringOrSlide].self, forKey: .slides)
        self.slides = stringsOrSlides.values.compactMap({
            switch $0 {
            case .string:
                return nil
            case .slide(let slide):
                return slide
            }
        })
    }
    
    init(title: String = "",
         description: String = "",
         slides: [Slide] = []) {
        self.title = title
        self.description = description
        self.slides = slides
    }
}

enum StringOrSlide: Codable {
    case string(String)
    case slide(Slide)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
            return
        }
        
        let slide = try container.decode(Slide.self)
        self = .slide(slide)
    }
}
