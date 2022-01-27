//
//  CostOverview.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class CostOverview: Codable {
    let clubFromLabel, jcrTitle, tagsTitle, perksSentence: String
    let callLabel, totalLabel, callToBookLabel: String
    var tags: [String] = []
    let totalFromLabel, totalFromAmount: String
    let callPhoneNumber, clubFromAmount: String
    let perks: [Perk]
        
    var callText: String {
        "\(callLabel) \(callPhoneNumber)\(callToBookLabel)"
    }

    enum CodingKeys: String, CodingKey {
        case clubFromLabel
        case jcrTitle = "jcr:title"
        case tagsTitle, perksSentence
        case callLabel, totalLabel, callToBookLabel
        case tags, totalFromLabel
        case totalFromAmount, callPhoneNumber, clubFromAmount, perks
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.clubFromLabel = try values.decode(String.self, forKey: .clubFromLabel)
        self.jcrTitle = try values.decode(String.self, forKey: .jcrTitle)
        self.tagsTitle = try values.decode(String.self, forKey: .tagsTitle)
        self.perksSentence = try values.decode(String.self, forKey: .perksSentence)
        self.callLabel = try values.decode(String.self, forKey: .callLabel)
        self.totalLabel = try values.decode(String.self, forKey: .totalLabel)
        self.callToBookLabel = try values.decode(String.self, forKey: .callToBookLabel)
        self.totalFromLabel = try values.decode(String.self, forKey: .totalFromLabel)
        self.totalFromAmount = try values.decode(String.self, forKey: .totalFromAmount)
        self.callPhoneNumber = try values.decode(String.self, forKey: .callPhoneNumber)
        self.clubFromAmount = try values.decode(String.self, forKey: .clubFromAmount)
        let stringsOrPerks = try values.decode([String: StringOrPerk].self, forKey: .perks)
        self.perks = stringsOrPerks.values.compactMap({
            switch $0 {
            case .string:
                return nil
            case .perk(let perk):
                return perk
            }
        })
        let decodedTags = try values.decode([String].self, forKey: .tags)
        self.tags = generateTagTitles(tagLabels: decodedTags)
    }
    
    init(clubFromLabel: String, jcrTitle: String, tagsTitle: String, perksSentence: String, callLabel: String, totalLabel: String, callToBookLabel: String, tags: [String], totalFromLabel: String, totalFromAmount: String, callPhoneNumber: String, clubFromAmount: String, perks: [Perk]) {
        self.clubFromLabel = clubFromLabel
        self.jcrTitle = jcrTitle
        self.tagsTitle = tagsTitle
        self.perksSentence = perksSentence
        self.callLabel = callLabel
        self.totalLabel = totalLabel
        self.callToBookLabel = callToBookLabel
        self.tags = tags
        self.totalFromLabel = totalFromLabel
        self.totalFromAmount = totalFromAmount
        self.callPhoneNumber = callPhoneNumber
        self.clubFromAmount = clubFromAmount
        self.perks = perks
    }
    
    private func generateTagTitles(tagLabels: [String]) -> [String] {
        var tagArray = [String]()
        for tag in tagLabels {
            let substrings = tag.components(separatedBy: "/")
            if substrings.count > 1 {
                tagArray.append(substrings[1].replacingOccurrences(of: "-", with: " ").uppercased())
            } else {
                continue
            }
        }
        
        return tagArray
    }
}

enum StringOrPerk: Codable {
    case string(String)
    case perk(Perk)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let string = try? container.decode(String.self) {
            self = .string(string)
            return
        }
        
        let perk = try container.decode(Perk.self)
        self = .perk(perk)
    }
}
