// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit
import RealmSwift

public class PixelArtRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted public var name: String

    @Persisted public var dateCreation: Date

    @Persisted public var dateLastModification: Date

    @Persisted public var pixels: RealmSwift.List<PixelRealm>

    @Persisted public var uuid: String

    public convenience init(from pixelArt: PixelArt) {
        self.init()

        name = pixelArt.name
        dateCreation = pixelArt.dateCreation
        dateLastModification = pixelArt.dateLastModification
        uuid = pixelArt.id

        for pixel in pixelArt.pixels {
            let pixelRealm = PixelRealm(from: pixel)

            pixels.append(pixelRealm)
        }
    }

    public func asPixelArt() -> PixelArt {
        var myPixels: [Pixel] = []

        for pixelRealm in pixels {
            myPixels.append(pixelRealm.asPixel())
        }

        var pixelArt = PixelArt(pixels: myPixels,
                                name: name,
                                dateCreation: dateCreation,
                                dateLastModification: dateLastModification)
        pixelArt.id = uuid

        return pixelArt
    }
}
