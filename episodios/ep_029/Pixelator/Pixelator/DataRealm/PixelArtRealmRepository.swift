//
//  PixelArtRealmRepository.swift
//  Pixelator
//
//  Created by Diego Freniche Brito on 7/7/22.
//

import Foundation
import RealmSwift
import PixelArtKit

struct PixelArtRealmRepository: PixelArtRepository {
    let realm: Realm?
    
    func load() async -> [PixelArt] {
        let pixelArts = realm?.objects(PixelArtRealm.self)
        
        var arrayOfPixelArt: [PixelArt] = []
        
        pixelArts?.enumerated().forEach { (index, pixelArtRealm) in
            arrayOfPixelArt.append(pixelArtRealm.asPixelArt())
        }
        
        return arrayOfPixelArt
    }
    
    func save(pixelArts: [PixelArt]) async -> Bool {
        do {
            for pixelArt in pixelArts {
                try realm?.write {
                    realm?.add(PixelArtRealm(from: pixelArt))
                }
            }
            return true
            
        } catch {
            print("Error adding pixel Art \( error )")
            return false
        }
    }
}
