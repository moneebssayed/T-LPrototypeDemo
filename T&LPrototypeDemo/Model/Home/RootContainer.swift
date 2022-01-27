//
//  RootContainer.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

class RootContainer: Codable {
    let container: MainContainer

    init(container: MainContainer) {
        self.container = container
    }
}
