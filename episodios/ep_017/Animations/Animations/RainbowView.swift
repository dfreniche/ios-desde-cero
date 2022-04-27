//
//  RainbowView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

struct RainbowView: View {
    @State private var nextColor = 0
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack {
            ForEach(0 ..< rainbowColors.count) { color in
                let finalIdx = (color + nextColor) % rainbowColors.count
                
                Spacer()
                    .frame(maxHeight: .infinity)
                    .background(rainbowColors[finalIdx])
            }
            .animation(.linear, value: nextColor)
        }.onTapGesture {
            nextColor = nextColor + 1
        }.onReceive(timer) { _ in
            nextColor = nextColor + 1
        }
    }
}

struct RainbowView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowView()
    }
}
