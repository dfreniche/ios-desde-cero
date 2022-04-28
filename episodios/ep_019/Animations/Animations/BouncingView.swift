//
//  BouncingView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

struct BouncingView: View {
    
    @State private var verticalOffset = 100.0
    
    var body: some View {
        ZStack {
            Color
                .gray
                
            Image("charizard")
                .resizable()
                .scaledToFit()
                .offset(y: verticalOffset)
                .animation(.spring(response: 0.4,
                                   dampingFraction: 0.45,
                                   blendDuration: 0)
                            .repeatForever(autoreverses: false),
                           value: verticalOffset)
        }
        .onAppear {
            verticalOffset = -100
        }
    }
}

struct BouncingView_Previews: PreviewProvider {
    static var previews: some View {
        BouncingView()
    }
}
