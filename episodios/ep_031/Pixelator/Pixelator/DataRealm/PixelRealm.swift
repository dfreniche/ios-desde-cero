// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit
import Realm
import RealmSwift
import SwiftUI

public class PixelRealm: RealmSwift.Object {
    @Persisted(primaryKey: true)  var _id: ObjectId

    @Persisted  public var row: Int

    @Persisted  public var col: Int

    @Persisted  public var colorRedComponent: Double
    @Persisted  public var colorGreenComponent: Double
    @Persisted  public var colorBlueComponent: Double
    @Persisted  public var colorAlphaComponent: Double

    public convenience init(from pixel: Pixel) {
        self.init()

        row = pixel.row
        col = pixel.col

        let (r, g, b, a) = pixel.color.rgbaComponents()

        colorRedComponent = r
        colorGreenComponent = g
        colorBlueComponent = b
        colorAlphaComponent = a
    }

    public func asPixel() -> Pixel {
        let color = Color(.sRGB,
                          red: colorRedComponent,
                          green: colorGreenComponent,
                          blue: colorBlueComponent,
                          opacity: colorAlphaComponent)

        return Pixel(row: row, col: col, color: color)
    }
}
