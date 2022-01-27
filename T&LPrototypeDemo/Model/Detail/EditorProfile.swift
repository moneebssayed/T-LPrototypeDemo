//
//  EditorProfile.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

class EditorProfile: Codable {
    let content, text: String?
    
    var fullDescription: String {
        let parsedString = content?.deleteHTMLTags(tags: ["a", "h3", "p"])
        
        if let substrings = parsedString?.components(separatedBy: "\n"),
           substrings.count > 1 {
            return substrings[1]
        } else {
            return ""

        }
    }

    enum CodingKeys: String, CodingKey {
        case content, text
    }

    init(content: String?, text: String?) {
        self.content = content?.deleteHTMLTags(tags: ["a", "h3", "p"])
        self.text = text?.deleteHTMLTags(tags: ["a", "h3", "p"])
    }
}

extension String {
    func deleteHTMLTag(_ tag: String) -> String {
        return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
    }

    func deleteHTMLTags(tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag)
        }
        return mutableString
    }
}


