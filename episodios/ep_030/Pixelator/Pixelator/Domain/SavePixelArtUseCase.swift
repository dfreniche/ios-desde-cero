//
//  SavePixelArtUseCase.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 11/7/22.
//

import Foundation
import PixelArtKit

struct SavePixelArtUseCase: UseCase {
    typealias InType = PixelArt
    
    typealias OutType = Bool
    
    let repository: PixelArtRepository
    
    func execute(inParameter: PixelArt?) async -> Bool {
        // check business rules
        guard let pixelArt = inParameter else { return false }
        return await repository.save(pixelArt: pixelArt)
    }
}
