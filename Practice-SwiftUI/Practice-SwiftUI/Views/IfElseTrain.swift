//
//  IfElseTrain.swift
//  Practice-SwiftUI
//
//  Created by Hitesh on 13/10/24.
//

import SwiftUI

struct IfElseTrain: View {
    var longerTrain: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                if longerTrain {
                    Image(systemName: "train.side.middle.car")
                }
                Image(systemName: "train.side.front.car")
            }
            Divider()
        }
    }
}

struct IfElseTrain_Previews: PreviewProvider {
    static var previews: some View {
        IfElseTrain(longerTrain: true)
        IfElseTrain(longerTrain: false)
    }
}
