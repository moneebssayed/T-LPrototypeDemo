//
//  CostOverviewView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/11/22.
//

import SwiftUI

struct CostOverviewView: View {
    let costOverview: CostOverview
    
    var body: some View {
        VStack {
            Text(costOverview.jcrTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            Divider()
            Text(costOverview.tagsTitle)
            HStack(alignment: .center) {
                VStack(alignment: .trailing) {
                    ForEach(costOverview.tags, id: \.self) { tag in
                        TagView(tag: tag)
                    }
                }
            }
            Divider()
            HStack(alignment: .center) {
                Text(costOverview.totalLabel)
                    .fontWeight(.medium)
                VStack(alignment: .trailing) {
                    generateTotalText()
                    generateClubText()
                }
            }
            generatePhoneCallButton(phoneNumber: costOverview.callPhoneNumber,
                                    label: costOverview.callText.uppercased(),
                                    hasTextStyle: true)
                .buttonStyle(BookButtonStyle())
            Divider()
            PerksView(perks: costOverview.perks)
        }
        .background(Color.bookViewTan)
    }
    
    private func generateClubText() -> some View {
        return VStack(alignment: .trailing) {
            Text(costOverview.clubFromLabel)
            Text(costOverview.clubFromAmount)
        }.foregroundColor(.gray)
    }
    
    private func generateTotalText() -> some View {
        return VStack(alignment: .trailing) {
            Text(costOverview.totalFromLabel)
            Text(costOverview.totalFromAmount)
        }
    }
}

struct CostOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        CostOverviewView(costOverview: CostOverview(clubFromLabel: "Club Member Preferred Pricing starting at:", jcrTitle: "CAPTIVATING CHARLESTON", tagsTitle: "Personalize your Experience:", perksSentence: "", callLabel: "Call", totalLabel: "Total", callToBookLabel: " to Book", tags: ["AFRICAN AMERICAN HISTORY TOUR", "SAIL THE CHARLESTON HARBOR AT SUNSET", "UPPER KING STREET CULINARY TOUR", "CHARLESTON S ALLEYS & HIDDEN PASSAGES TOUR"], totalFromLabel: "Accommodations starting at:", totalFromAmount: "$197 per night", callPhoneNumber: "800-989-1862", clubFromAmount: "$170 per night", perks: [Perk(jcrTitle: "Preferred Pricing", fileReference: "/content/dam/itineraries/club-perks/1_Curated_Experiences.jpg", bestBadge: nil), Perk(jcrTitle: "Exclusive Experiences", fileReference: "/content/dam/itineraries/club-perks/1_Curated_Experiences.jpg", bestBadge: nil), Perk(jcrTitle: "Customized Concierge", fileReference: "/content/dam/itineraries/club-perks/2_Customized_Concierge.jpg", bestBadge: nil)]))
    }
}
