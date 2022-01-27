//
//  Root.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

class Root: Codable {
    let container: RootContainer

    init(container: RootContainer) {
        self.container = container
    }
}
