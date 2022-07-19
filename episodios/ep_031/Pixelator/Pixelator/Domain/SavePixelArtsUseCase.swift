// (C) Diego Freniche 2022 - MIT License

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
