//
//  SlideDetailsView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/10/22.
//

import SwiftUI

struct SlideDetailsView: View {
    @ObservedObject var detailModel: DetailContentViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var btnBack : some View {
        Text("")
    }
    
    @State private var heroHeight = UIScreen.screenHeight
    @State private var backgroundColor: Color = .white
    
    var body: some View {
        ScrollView {
            VStack {
                generateHeroImage(url: detailModel.heroCarousel.heroItems.first?.fullImageURL)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                Button("About") {
                                    withAnimation() {
                                        detailModel.aboutShowing.toggle()
                                        detailModel.costOverviewShowing = false
                                        detailModel.bookCTAShowing = false
                                    }
                                }.buttonStyle(CallButtonStyle())
                                Button("Cost") {
                                    withAnimation() {
                                        detailModel.costOverviewShowing.toggle()
                                        detailModel.aboutShowing = false
                                        detailModel.bookCTAShowing = false
                                    }
                                }.buttonStyle(CallButtonStyle())
                                Button("Book") {
                                    withAnimation() {
                                        detailModel.bookCTAShowing.toggle()
                                        detailModel.costOverviewShowing = false
                                        detailModel.aboutShowing = false
                                    }
                                }.buttonStyle(CallButtonStyle())
                            }
                        }.padding()
                    }
                
                expandView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                
            }.onAppear {
                detailModel.fetchData()
            }
        }
        .background(determineBackgroundColor())
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.backward")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5)
                Text("Back")
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 5)
            }
        })
    }
    
    private func determineHeroHeight() -> CGFloat {
        detailModel.aboutShowing || detailModel.costOverviewShowing || detailModel.bookCTAShowing ? UIScreen.screenHeight/4 : UIScreen.screenHeight
    }
    
    private func determineBackgroundColor() -> Color {
        detailModel.aboutShowing ? Color.editorGreen : Color.bookViewTan
    }
    
    @ViewBuilder private func expandView() -> some View {
        if detailModel.aboutShowing {
            EditorProfileView(title: detailModel.subtitle, description: detailModel.editorProfile.fullDescription)
        }
        
        if detailModel.bookCTAShowing {
            BookCTAView(title: detailModel.title,
                        subtitle: detailModel.subtitle,
                        phoneNumber: detailModel.bookCTA.ctaNumber)
        }
        
        if detailModel.costOverviewShowing {
            CostOverviewView(costOverview: detailModel.costOverview)
        }
    }
    
    @ViewBuilder private func generateHeroImage(url: URL?) -> some View {
        if let url = url {
            CacheAsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: UIScreen.screenWidth/2.25, height: UIScreen.screenHeight/3, alignment: .center)
                    
                case .success(let image):
                    image
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFill()// 1.5
                        .frame(width: UIScreen.screenWidth, height: determineHeroHeight(), alignment: .center)
                        .clipped()
                        .overlay {
                            VStack(alignment: .center) {
                                Text(detailModel.title)
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .shadow(color: .black, radius: 1)
                                    .padding(3)
                                    .foregroundColor(.white)
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
}

struct SlideDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SlideDetailsView(detailModel: DetailContentViewModel())
    }
}
