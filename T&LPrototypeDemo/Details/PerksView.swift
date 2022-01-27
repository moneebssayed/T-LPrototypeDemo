//
//  PerksView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/12/22.
//

import SwiftUI

struct PerksView: View {
    
    let perks: [Perk]
    
    var body: some View {
        HStack {
            ForEach(perks) { perk in
                VStack {
                generatePerkImage(url: perk.fullImageURL)
                    Text(perk.jcrTitle)
                        .multilineTextAlignment(.center)
                }
            }
        }.padding()
    }
    
    @ViewBuilder private func generatePerkImage(url: URL?) -> some View {
        if let url = url {
            CacheAsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: UIScreen.screenWidth/2.5, height: UIScreen.screenHeight/10, alignment: .center)
                    
                case .success(let image):
                    image
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: UIScreen.screenWidth/3, minHeight: 0, maxHeight: UIScreen.screenHeight/10, alignment: .center)
                        .clipped()
                    
                case .failure(let error):
                    Text(error.localizedDescription)
                @unknown default:
                    fatalError()
                }
            }
        }
    }

}

struct PerksView_Previews: PreviewProvider {
    static var previews: some View {
        PerksView(perks: [Perk(jcrTitle: "Preferred Pricing", fileReference: "/content/dam/itineraries/club-perks/1_Curated_Experiences.jpg", bestBadge: nil), Perk(jcrTitle: "Exclusive Experiences", fileReference: "/content/dam/itineraries/club-perks/2_Customized_Concierge.jpg", bestBadge: nil), Perk(jcrTitle: "Customized Concierge", fileReference: "/content/dam/itineraries/club-perks/3_Preferred_Pricing.jpg", bestBadge: nil)])
    }
}
