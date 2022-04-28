//
//  AnimationsApp.swift
//  Animations
//
//  Created by Diego Freniche Brito on 19/4/22.
//

import SwiftUI

@main
struct AnimationsApp: App {
    let columns = [
        GridItem(.fixed(200.0), spacing: 10.0, alignment: .center),
        GridItem(.flexible(minimum: 80, maximum: 130), spacing: 10.0, alignment: .center),
    ]
    
    private let views: [(title: String, icon: String, view: AnyView)] = [
        ("Particle", "rotate.3d", AnyView(ParticleEffectView())),
        ("3D", "rotate.3d", AnyView(Rotate3DView())),
        ("Plane", "airplane", AnyView(PlaneView())),
        ("Rainbow", "paintpalette.fill", AnyView(RainbowView())),
        ("Bouncy Img", "arrowshape.bounce.right", AnyView(BouncingView())),
        ("Rotate", "square.fill", AnyView(RotatingBackgroundView())),
    ]
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<views.count) { index in
                            NavigationLink(destination: views[index].view) {
                                VStack(spacing: 20) {
                                    Image(systemName: views[index].icon)
                                    Text(views[index].title)
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                }
                            }.padding()
                        }
                    }
                }
            }
            
//            TabView {
//                ParticleEffectView()
//                    .tabItem {
//                        Image(systemName: "rotate.3d")
//                        Text("Particle")
//                    }
//
//                Rotate3DView()
//                    .tabItem {
//                        Image(systemName: "rotate.3d")
//                        Text("3D")
//                    }
//
//                PlaneView()
//                    .tabItem {
//                        Image(systemName: "airplane")
//                        Text("Plane")
//                    }
//
//                RainbowView()
//                    .tabItem {
//                        Image(systemName: "paintpalette.fill")
//                        Text("Rainbow")
//                    }
//
//                BouncingView()
//                    .tabItem {
//                        Image(systemName: "arrowshape.bounce.right")
//                        Text("Bouncy Img")
//                    }
//
//                RotatingBackgroundView()
//                    .tabItem {
//                        Image(systemName: "square.fill")
//                        Text("Rotate")
//                    }
//            }
        }
    }
}
