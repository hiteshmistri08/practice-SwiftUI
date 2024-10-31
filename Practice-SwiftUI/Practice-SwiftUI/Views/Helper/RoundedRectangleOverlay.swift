//
//  RoundedRectangleOverlay.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 31/10/24.
//

import SwiftUI

struct RoundedRectangleOverlay: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray.opacity(0.5))
            }
    }
}

extension View {
    func roundedRectengleOverlay() -> some View {
        modifier(RoundedRectangleOverlay())
    }
}
