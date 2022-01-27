//
//  View+Extension.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/12/22.
//

import SwiftUI

extension View {
    func generatePhoneCallButton(phoneNumber: String,
                                 label: String,
                                 hasTextStyle: Bool = false) -> some View {
        let phone = "tel://"
        let phoneNumberformatted = phone + phoneNumber
        let button = Button(action: {
            guard let url = URL(string: phoneNumberformatted) else { return }
            UIApplication.shared.open(url)
        }) {
            if hasTextStyle {
                Text(label.uppercased())
                    .font(.title3)
                    .fontWeight(.black)
            } else {
                Text(label)
            }
        }
        
        return button
    }
    
}
