//
//  PixelArtRealm.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 7/7/22.
//

import Foundation
import RealmSwift
import PixelArtKit

public class PixelArtRealm: Object {
    @Persisted(primaryKey: true) var _id: ObjectId

    @Persisted
    public var name: String
    
    @Persisted
    public var dateCreation: Date
    
    @Persisted
    public var dateLastModification: Date
    
    @Persisted
    public var pixels: RealmSwift.List<PixelRealm>
    
    public convenience init(from pixelArt: PixelArt) {
        self.init()
        
        self.name = pixelArt.name
        self.dateCreation = pixelArt.dateCreation
        self.dateLastModification = pixelArt.dateLastModification
        
        for pixel in pixelArt.pixels {
            let pixelRealm = PixelRealm(from: pixel)
            
            pixels.append(pixelRealm)
        }
    }
    
    public func asPixelArt() -> PixelArt {
        var myPixels: [Pixel] = []
        
        for pixelRealm in self.pixels {
            myPixels.append(pixelRealm.asPixel())
        }
        
        let pixelArt = PixelArt(pixels: myPixels,
                                name: self.name,
                                dateCreation: self.dateCreation,
                                dateLastModification: self.dateLastModification)
        return pixelArt
    }
}
