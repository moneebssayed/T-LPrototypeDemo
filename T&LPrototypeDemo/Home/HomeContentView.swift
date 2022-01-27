//
//  ContentView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/7/22.
//

import SwiftUI

struct HomeContentView: View {
    
    // MARK: Enivironment Objects
    
    @ObservedObject var homeModel: HomeContentViewModel
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SlideDetailsView(detailModel: DetailContentViewModel()),
                               isActive: self.$homeModel.navigateToDetails) {}

                Text(homeModel.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(1)
                Text(homeModel.description)
                    .multilineTextAlignment(.center)
                    .padding()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center) {
                        ForEach(homeModel.slides.sorted()) { slide in
                            Button {
                                homeModel.navigateToDetails = true
                                self.timer.upstream.connect().cancel()
                            } label: {
                                withAnimation() {
                                    SlideView(slide: slide)
                                        .shadow(color: .black, radius: 6, x: 0, y: 4)
                                }
                            }
                        }
                    }.padding()
                }
            }
            .onReceive(timer) { _ in
                homeModel.fetchData()
            }
            .onAppear {
                homeModel.fetchData()
            }
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(homeModel: HomeContentViewModel())
    }
}
