//
//  GenerateRandomPixelArt.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 23/5/22.
//

import PixelArtKit
import Foundation

func generateRandomPixelArts(pixelArtCount: Int = 20) -> [PixelArt] {
    var pixelArts: [PixelArt] = []

    for i in 0 ..< pixelArtCount {
        let pixelArt = PixelArt(pixels: PixelArt.generatePixelArtPattern(size: 10),
                                name: "pixel art \(i)",
                                dateCreation: Date(),
                                dateLastModification: Date())

        pixelArts.append(pixelArt)
    }

    return pixelArts
}
