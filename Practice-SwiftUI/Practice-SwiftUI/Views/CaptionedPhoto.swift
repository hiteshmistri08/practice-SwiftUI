//
//  CaptionedPhoto.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 29/09/24.
//

import SwiftUI

struct CaptionedPhoto: View {
    var imageName: String
    var captionText: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Caption(text: captionText)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
    }
}

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .background(Color.white.opacity(0.75),
                        in: RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
    }
}

struct CaptionedPhoto_Previews: PreviewProvider {
    static var previews: some View {
        CaptionedPhoto(imageName: "turtlerock", captionText: "This photo is wider")
    }
}
