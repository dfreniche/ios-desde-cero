//
//  LoadPixelArtsUseCase.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 23/6/22.
//

import Foundation
import PixelArtKit

struct LoadPixelArtsUseCase {
    let repository: PixelArtRepository
    
    func load() async -> [PixelArt] {
        // Business Rules
        
        await repository.load()
    }
}
