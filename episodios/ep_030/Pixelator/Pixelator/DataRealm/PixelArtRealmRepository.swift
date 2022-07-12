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
        for pixelArt in pixelArts {
            let success = await save(pixelArt: pixelArt)
            if !success {
                return false
            }
        }
        return true
    }
    
    func save(pixelArt: PixelArt) async -> Bool {
        do {
            try realm?.write {
                realm?.add(PixelArtRealm(from: pixelArt))
            }
            return true
        } catch {
            print("Error adding pixel Art \( error )")
            return false
        }
    }
}
