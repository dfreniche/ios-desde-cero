// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit

protocol PixelArtRepository {
    /// Loads PixelArts from cache
    /// - Returns: an array of PixelArts or empty array if there's nothing
    func load() async -> [PixelArt]

    /// Saves an array of Pixel Arts
    /// - Parameter pixelArts: array of PixelArts to be saved
    /// - Returns: true if success
    func save(pixelArts: [PixelArt]) async -> Bool

    func save(pixelArt: PixelArt) async -> Bool
    func delete(pixelArt: PixelArt) async -> Bool
}
