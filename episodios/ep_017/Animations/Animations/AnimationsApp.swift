//
//  AnimationsApp.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

@main
struct AnimationsApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Rotate3DView()
                    .tabItem {
                        Image(systemName: "rotate.3d")
                        Text("3D")
                    }
                
                PlaneView()
                    .tabItem {
                        Image(systemName: "airplane")
                        Text("Plane")
                    }
                
                RainbowView()
                    .tabItem {
                        Image(systemName: "paintpalette.fill")
                        Text("Rainbow")
                    }
                
                BouncingView()
                    .tabItem {
                        Image(systemName: "arrowshape.bounce.right")
                        Text("Bouncy Img")
                    }
                
                RotatingBackgroundView()
                    .tabItem {
                        Image(systemName: "square.fill")
                        Text("Rotate")
                    }
            }
        }
    }
}
