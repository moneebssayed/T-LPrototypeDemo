//
//  ItineraryCell.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/7/22.
//

import SwiftUI

struct SlideView: View {
    var slide: Slide
    var body: some View {
        CacheAsyncImage(url: slide.fullImageURL!) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: UIScreen.screenWidth/2.25, height: UIScreen.screenHeight/3, alignment: .center)

            case .success(let image):
                image
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.screenWidth/2.25, height: UIScreen.screenHeight/3, alignment: .center)
                    .clipped()
                    .overlay {
                        VStack(alignment: .leading) {
                            HStack(alignment: .bottom) {
                                Text(slide.title)
                                    .font(.headline)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.leading)
                                    .shadow(color: .black, radius: 1)
                                    .padding(3)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            Spacer()
                            DurationOverlay(duration: slide.duration)
                        }
                    }
            case .failure(let error):
                Text(error.localizedDescription)
            @unknown default:
                fatalError()
            }
        }
    }
}

struct DurationOverlay: View {
    let duration: String
    var body: some View {
        ZStack {
            Text(duration)
                .font(.callout)
                .fontWeight(.bold)
                .padding(EdgeInsets(top: 1, leading: 5, bottom: 1, trailing: 5))
                .foregroundColor(.black)
        }.background(Color.white)
        .cornerRadius(10.0)
        .padding(6)
    }
}

struct ItineraryCell_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(slide: Slide(duration: "5 Days", fileReference: "/content/dam/itineraries/charleston/T+L Itinerary-Charleston_2280x1100 Hero.jpg",
                               headline: "CURATED EXPERIENCE",
                               link: nil,
                               tags: [],
                               title: "Captivating Charleston"))
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
