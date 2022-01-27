//
//  HomeContentViewModel.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/7/22.
//

import Foundation

final class HomeContentViewModel: ObservableObject {
    
    @Published
    var slides: [Slide] = []
    @Published
    var title = ""
    @Published
    var description = ""
    @Published
    var navigateToDetails = false
    
    @MainActor
    func fetchData() {
        Task.init {
            do {
                let page = try await APILoader.fetchPage()
                let itinerary = page.root.container.container.contentContainer.curatedItinerary
                if self.slides.isEmpty || self.slides.count != itinerary.slides.count || self.slides == itinerary.slides {
                    self.slides = itinerary.slides.sorted()
                }
                
                self.title = itinerary.title
                self.description = itinerary.description
            } catch {
                // .. handle error
            }
        }
    }
    
    func toggleNavigation() {
        navigateToDetails.toggle()
    }
    
    private func charlestonFirstSearch(slide1: Slide, slide2: Slide) -> Bool {
        if slide1.title.lowercased().contains("charleston") {
            return true
        } else if slide2.title.lowercased().contains("charleston") {
            return false
        }
        
        return slide1.title.lowercased() < slide1.title.lowercased()
    }
}
