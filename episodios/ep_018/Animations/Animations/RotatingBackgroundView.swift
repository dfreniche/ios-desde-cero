//
//  ContentView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

struct RotatingBackgroundView: View {    
    @State private var nextColor = 0
    @State private var angle = 0.0
    
    var body: some View {
        ZStack {
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(rainbowColors[nextColor])
                .rotationEffect(Angle(degrees: angle))
                .animation(.spring(response: 0.40, dampingFraction: 0.55, blendDuration: 0), value: angle)
            
            Button("Click Me!") {
                if nextColor < rainbowColors.count - 1 {
                    nextColor = nextColor + 1
                } else {
                    nextColor = 0
                }
                angle = angle + 30
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RotatingBackgroundView()
    }
}
