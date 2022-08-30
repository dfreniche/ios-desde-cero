// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit

struct DeletePixelArtUseCase: UseCase {
    typealias InType = PixelArt
    typealias OutType = Bool

    let repository: PixelArtRepository

    func execute(inParameter: PixelArt?) async -> Bool {
        guard let pixelArt = inParameter else { return false }

        return await repository.delete(pixelArt: pixelArt)
    }
}
