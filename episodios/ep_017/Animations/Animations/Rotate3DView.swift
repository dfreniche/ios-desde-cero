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
    
    var body: some View {
        VStack {
            ZStack {
                Color
                    .gray
                
                Image("charizard")
                    .resizable()
                    .scaledToFit()
            }
            
            VStack {
                Toggle("X", isOn: $rotateX)
                Toggle("Y", isOn: $rotateY)
                Toggle("Z", isOn: $rotateZ)
            }
        }
    }
}

struct Rotate3DView_Previews: PreviewProvider {
    static var previews: some View {
        Rotate3DView()
    }
}
