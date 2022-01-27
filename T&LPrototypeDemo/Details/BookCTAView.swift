//
//  BookCTAView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/11/22.
//

import SwiftUI

struct BookCTAView: View {
    
    let title: String
    let subtitle: String
    let phoneNumber: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.black)
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 1, x: 0, y: 1)
            generatePhoneCallButton(phoneNumber: phoneNumber, label: phoneNumber)
                .buttonStyle(CallButtonStyle())
            Text(subtitle)
                .padding()
                .multilineTextAlignment(.center)
                .shadow(color: .black, radius: 1, x: 0, y: 1)
        }
        .background(Color.bookViewTan)
            
    }
}

struct BookCTAView_Previews: PreviewProvider {
    static var previews: some View {
        BookCTAView(title: "BOOK WITH THOSE WHO KNOW", subtitle: "Call our travel experts today to book this itinerary that was inspired by you, and curated by us.", phoneNumber: "123-345-7890")
    }
}
