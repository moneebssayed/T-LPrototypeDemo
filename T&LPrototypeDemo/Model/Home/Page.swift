//
//  Page.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

import Foundation

// MARK: - Page
class Page: Codable {
    let root: Root

    init(root: Root) {
        self.root = root
    }
}
