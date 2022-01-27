//
//  CallButtonStyle.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/11/22.
//

import SwiftUI
struct CallButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.callButtonYellow)
            .foregroundColor(.black)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
                        .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
                        .shadow(color: .black, radius: 2, x: 0, y: 1)
    }
}

struct CallButton: View {
    var body: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(CallButtonStyle())

    }
}

struct CallButton_Previews: PreviewProvider {
    static var previews: some View {
        CallButton()
    }
}
