//
//  PixelArtRepository.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 23/6/22.
//

import Foundation
import PixelArtKit

protocol PixelArtRepository {
    func load() async -> [PixelArt]
    func save(pixelArts: [PixelArt]) async -> Bool
}
