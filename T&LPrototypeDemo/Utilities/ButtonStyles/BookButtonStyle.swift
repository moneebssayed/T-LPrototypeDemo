//
//  BookButtonStyle.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/12/22.
//

import SwiftUI

struct BookButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.white)
            .foregroundColor(.black)
            .clipShape(Rectangle())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
                        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                        .shadow(color: .black, radius: 2, x: 0, y: 1)
    }
}

struct BookButton: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(BookButtonStyle())
        .background(.black)
    }
}

struct BookButton_Previews: PreviewProvider {
    static var previews: some View {
        BookButton()
    }
}
