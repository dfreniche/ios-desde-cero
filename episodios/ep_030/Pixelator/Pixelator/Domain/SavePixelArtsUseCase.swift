//
//  SavePixelArtsUseCase.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 7/7/22.
//

import Foundation
import PixelArtKit

struct SavePixelArtsUseCase: UseCase {
    typealias InType = [PixelArt]
    
    typealias OutType = Bool
    
    let repository: PixelArtRepository
    
    func execute(inParameter: [PixelArt]?) async -> Bool {
        // check business rules
        
        await repository.save(pixelArts: inParameter ?? [])
    }
}
