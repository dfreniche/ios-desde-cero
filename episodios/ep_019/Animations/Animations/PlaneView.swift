//
//  PlaneView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 21/4/22.
//

import SwiftUI

import SwiftUI

struct PlaneView: View {
    private let circleDiameter = 300.0
    private let planeSide: CGFloat = 40.0
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Circle()
                .stroke()
                .scaledToFit()
                .frame(width: circleDiameter)
            
            Image(systemName: "airplane")
                .resizable()
                .scaledToFit()
                .frame(width: planeSide)
                .rotationEffect(.degrees(90.0))
                .frame(width: circleDiameter + planeSide, alignment: .trailing)
        }
        .rotationEffect(.degrees(animate ? 360.0 : 0.0))
        .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: animate)
        .onAppear {
            animate = true
        }.background(LinearGradient(colors: rainbowColors, startPoint: .top, endPoint: .bottom))
        
    }
    
}

struct PlaneView_Previews: PreviewProvider {
    static var previews: some View {
        PlaneView()
    }
}
