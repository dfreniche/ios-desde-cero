//
//  RainbowView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

struct RainbowView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< rainbowColors.count) { color in
                Spacer()
                    .frame(maxHeight: .infinity)
                    .background(rainbowColors[color])
            }

        }
    }
}

struct RainbowView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowView()
    }
}
