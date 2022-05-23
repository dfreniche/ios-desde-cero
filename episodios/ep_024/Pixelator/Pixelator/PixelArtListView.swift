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
    @State var pixelArts: [PixelArt]

    var body: some View {
        NavigationView {
            List($pixelArts) { pixelArt in
                NavigationLink(destination: PixelDrawingView(pixelArt: pixelArt)) {
                    // this is the "cell"
                    VStack {
                        Text("\(pixelArt.wrappedValue.name)")
                        PixelArtView(pixelArt: pixelArt.wrappedValue, colums: PixelDrawingView.generateColumns(10, columnWidht: 3), pixelSquareSize: 2)
                    }
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
