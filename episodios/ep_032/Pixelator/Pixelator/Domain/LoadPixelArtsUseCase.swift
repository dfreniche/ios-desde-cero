// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit

struct LoadPixelArtsUseCase: UseCase {
    typealias InType = Void

    typealias OutType = [PixelArt]

    let repository: PixelArtRepository

    func execute(inParameter _: Void? = nil) async -> [PixelArt] {
        // Business Rules

        await repository.load()
    }
}
