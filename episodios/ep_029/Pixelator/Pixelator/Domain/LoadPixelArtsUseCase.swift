//
//  LoadPixelArtsUseCase.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 23/6/22.
//

import Foundation
import PixelArtKit

struct LoadPixelArtsUseCase: UseCase {
    typealias InType = Void
    
    typealias OutType = [PixelArt]
    
    let repository: PixelArtRepository
    
    
    func execute(inParameter: Void? = nil) async -> [PixelArt] {
        // Business Rules
        
        await repository.load()
    }
}
