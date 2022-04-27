//
//  ParticleEffectView.swift
//  Animations
//
//  Created by Diego Freniche Brito on 26/4/22.
//

import SwiftUI
import SpriteKit

class RainScene: SKScene {
    let rainEmitterNode = SKEmitterNode(fileNamed: "Rain.sks")
    
    override func didMove(to view: SKView) {
        guard let rainEmitterNode = rainEmitterNode else { return }
        
        rainEmitterNode.particleSize = CGSize(width: 100, height: 100)
        
        addChild(rainEmitterNode)
    }
    
    override func didChangeSize(_ oldSize: CGSize) {
        guard let rainEmitterNode = rainEmitterNode else { return }

        rainEmitterNode.particlePosition = CGPoint(x: size.width/2, y: size.height)
        rainEmitterNode.particlePositionRange = CGVector(dx: size.width, dy: size.height)
    }
}


struct ParticleEffectView: View {
    var scene: SKScene {
        let scene = RainScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            Color.gray
            
            Image("charizard")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            SpriteView(scene: scene, options: [.allowsTransparency])
                .ignoresSafeArea()
        }
    }
}

struct ParticleEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleEffectView()
    }
}
