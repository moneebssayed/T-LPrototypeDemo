//
//  T_LPrototypeDemoApp.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/7/22.
//

import SwiftUI

@main
struct T_LPrototypeDemoApp: App {
    @StateObject var homeModel = HomeContentViewModel()
    var body: some Scene {
        WindowGroup {
            HomeContentView(homeModel: homeModel)
//                .environmentObject(homeModel)
        }
    }
}
