// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit

struct PixelArtInMemoryRepository: PixelArtRepository {
    func load() async -> [PixelArt] {
        generateRandomPixelArts(pixelArtCount: 4)
    }

    func save(pixelArts _: [PixelArt]) async -> Bool {
        true
    }

    func save(pixelArt _: PixelArt) async -> Bool {
        true
    }

    func delete(pixelArt _: PixelArt) async -> Bool {
        true
    }
}
