// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit

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
