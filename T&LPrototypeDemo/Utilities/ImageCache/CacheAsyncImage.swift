//
//  CacheAsyncImage.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(url: URL,
         scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View {
        if let cached = ImageCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(url: url, scale: scale, transaction: transaction) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    
    func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        
        return content(phase)
    }
}

struct CacheAsyncImage_Previews: PreviewProvider {
    
    private static let exampleSlide = Slide(duration: "5 Days", fileReference: "/content/dam/itineraries/charleston/T+L Itinerary-Charleston_2280x1100 Hero.jpg",
                                            headline: "CURATED EXPERIENCE",
                                            link: nil,
                                            tags: [],
                                            title: "Captivating Charleston")
    static var previews: some View {
        
        CacheAsyncImage(url: CacheAsyncImage_Previews.exampleSlide.fullImageURL!) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
            case .failure(let error):
                Text(error.localizedDescription)
            @unknown default:
                fatalError()
            }
            
        }
    }
}

fileprivate class ImageCache {
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
