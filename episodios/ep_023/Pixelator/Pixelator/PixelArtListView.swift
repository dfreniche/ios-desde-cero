//
//  PixelArtListView.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 16/5/22.
//

import PixelArtKit
import SwiftUI

func generatePixelArts() -> [PixelArt] {
    var pixelArts: [PixelArt] = []

    for i in 0 ..< 20 {
        let pixelArt = PixelArt(pixels: PixelArt.generatePixelArtPattern(size: 10),
                                name: "pixel art \(i)",
                                dateCreation: Date(),
                                dateLastModification: Date())

        pixelArts.append(pixelArt)
    }

    return pixelArts
}

struct PixelArtListView: View {
    let pixelArts: [PixelArt]

    var body: some View {
        NavigationView {
            List(pixelArts) { pixelArt in
                NavigationLink(destination: PixelDrawingView(pixelArt: pixelArt)) {
                    // this is the "cell"
                    Text("\(pixelArt.name)")
                }
            }
            .navigationTitle("Pokemons")
        }
    }
}

struct PixelArtListView_Previews: PreviewProvider {
    static var previews: some View {
        PixelArtListView(pixelArts: generatePixelArts())
    }
}
