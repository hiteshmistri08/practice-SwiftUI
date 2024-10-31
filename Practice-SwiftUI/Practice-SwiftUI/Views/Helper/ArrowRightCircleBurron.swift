//
//  ArrowRightCircleBurron.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 31/10/24.
//

import SwiftUI

struct ArrowRightCircleBurron: View {
    var isDisable: Bool
    var action:() -> Void
    
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.right.circle.fill")
                .foregroundColor(isDisable ? .gray : .blue)
        }
        .disabled(isDisable)
    }
}

struct ArrowRightCircleBurron_Previews: PreviewProvider {
    static var previews: some View {
        ArrowRightCircleBurron(isDisable: false, action: {})
    }
}
