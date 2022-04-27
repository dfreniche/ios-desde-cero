//
//  Rotate3DView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 21/4/22.
//

import SwiftUI

struct Rotate3DView: View {
    @State var rotateX = false
    @State var rotateY = false
    @State var rotateZ = false
    @State var angle = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Color
                    .gray
                
                Image("charizard")
                    .resizable()
                    .scaledToFit()
                    .rotation3DEffect(Angle(degrees: angle), axis: (x: xAxis(), y: yAxis(), z: zAxis()))
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: angle)
            }
            
            Divider()
            
            VStack {
                Toggle("X", isOn: $rotateX)
                Toggle("Y", isOn: $rotateY)
                Toggle("Z", isOn: $rotateZ)
            }
            .padding()
        } // VStack
        .onAppear {
            angle = 360
        }
    }
    
    private func xAxis() -> CGFloat {
        rotateX ? 1.0 : 0.0
    }
    
    private func yAxis() -> CGFloat {
        rotateY ? 1.0 : 0.0
    }
    
    private func zAxis() -> CGFloat {
        rotateZ ? 1.0 : 0.0
    }
}

struct Rotate3DView_Previews: PreviewProvider {
    static var previews: some View {
        Rotate3DView()
    }
}
