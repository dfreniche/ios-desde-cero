//
//  PixelRealm.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 4/7/22.
//

import Foundation
import Realm
import RealmSwift
import PixelArtKit
import SwiftUI

public class PixelRealm: RealmSwift.Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    
    @Persisted
    public var row: Int
    
    @Persisted
    public var col: Int
    
    @Persisted
    public var colorRedComponent: Double
    @Persisted
    public var colorGreenComponent: Double
    @Persisted
    public var colorBlueComponent: Double
    @Persisted
    public var colorAlphaComponent: Double
    
    public convenience init(from pixel: Pixel) {
        self.init()
        
        self.row = pixel.row
        self.col = pixel.col
        
        let (r, g, b, a) = pixel.color.rgbaComponents()
    
        self.colorRedComponent = r
        self.colorGreenComponent = g
        self.colorBlueComponent = b
        self.colorAlphaComponent = a
    }
    
    public func asPixel() -> Pixel {
        let color = Color(.sRGB,
                          red: colorRedComponent,
                          green: colorGreenComponent,
                          blue: colorBlueComponent,
                          opacity: colorAlphaComponent)
        
        return Pixel(row: self.row, col: self.col, color: color)
    }
}
