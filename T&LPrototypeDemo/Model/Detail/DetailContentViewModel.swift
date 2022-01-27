//
//  DetailContentViewModel.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import Foundation

final class DetailContentViewModel: ObservableObject {
    
    @Published
    var heroCarousel: HeroCarousel = HeroCarousel(duration: "", heroItems: [])
    @Published
    var bookCTA: BookCTA = BookCTA(subtitle: "", ctaNumber: "", title: "")
    @Published
    var costOverview: CostOverview = CostOverview(clubFromLabel: "", jcrTitle: "", tagsTitle: "", perksSentence: "", callLabel: "", totalLabel: "", callToBookLabel: "", tags: [], totalFromLabel: "", totalFromAmount: "", callPhoneNumber: "", clubFromAmount: "", perks: [])
    @Published
    var editorProfile: EditorProfile = EditorProfile(content: "", text: "")
    @Published
    var title = ""
    @Published
    var subtitle = ""
    @Published
    var navigateToDetails = false
    @Published
    var costOverviewShowing = false
    @Published
    var bookCTAShowing = false
    @Published
    var aboutShowing = false
    
    @MainActor
    func fetchData() {
        Task.init {
            do {
                let detail = try await APILoader.fetchDetails()
                guard let rootContainer = detail.root.container?.container else { return }
                self.heroCarousel = rootContainer.heroCarousel
                self.bookCTA = rootContainer.bookCTA
                self.costOverview = rootContainer.costOverview
                self.editorProfile = rootContainer.editorProfile
                self.title = detail.pageTitle
                self.subtitle = detail.subtitle
            } catch {
                // .. handle error
            }
        }
    }
}
