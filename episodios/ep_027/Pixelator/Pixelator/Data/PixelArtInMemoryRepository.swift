//
//  PixelArtInMemoryRepository.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 23/6/22.
//

import Foundation
import PixelArtKit

struct PixelArtInMemoryRepository: PixelArtRepository {
    func load() async -> [PixelArt] {
        generateRandomPixelArts(pixelArtCount: 10)
    }
    
    func save(pixelArts: [PixelArt]) async -> Bool {
        true
    }
}
