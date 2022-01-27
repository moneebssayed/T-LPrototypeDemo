//
//  TagView.swift
//  T&LPrototypeDemo
//
//  Created by Moneeb S. Sayed on 1/12/22.
//

import SwiftUI

struct TagView: View {
    let tag: String
    var body: some View {
        Text(tag.uppercased())
            .fontWeight(.semibold)
            .padding()
            .frame(width: UIScreen.screenWidth/1.1, height: 100)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(tag: "AFRICAN-AMERICAN HISTORY TOUR")
    }
}
