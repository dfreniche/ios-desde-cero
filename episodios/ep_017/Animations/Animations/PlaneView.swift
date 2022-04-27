//
//  PlaneView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 21/4/22.
//

import SwiftUI

struct PlaneView: View {
    private let circleDiameter = 300.0
    @State private var moveAlongCirclePath = false
    
    var body: some View {
        ZStack {
            Spacer()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: rainbowColors, startPoint: .top, endPoint: .bottom))
            
            Circle()
                .stroke()
                .frame(width: circleDiameter, height: circleDiameter)
                .foregroundColor( Color("PlaneColor") )
            
            Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundColor( Color("PlaneColor") )
                .offset(y: -circleDiameter / 2)
                .rotationEffect(.degrees( moveAlongCirclePath ? 360 : 0 ))
                .animation(.linear(duration: moveAlongCirclePath ? 5 : 0).repeatForever(autoreverses: false), value: moveAlongCirclePath)
                .onAppear {
                    moveAlongCirclePath.toggle()
                }
                .onDisappear {
                    moveAlongCirclePath = false
                }
        }
    }
}

struct PlaneView_Previews: PreviewProvider {
    static var previews: some View {
        PlaneView()
    }
}
