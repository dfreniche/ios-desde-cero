// (C) Diego Freniche 2022 - MIT License

import Foundation
import PixelArtKit
import RealmSwift

struct PixelArtRealmRepository: PixelArtRepository {
    let realm: Realm?

    func load() async -> [PixelArt] {
        let pixelArts = realm?.objects(PixelArtRealm.self)

        var arrayOfPixelArt: [PixelArt] = []

        pixelArts?.enumerated().forEach { _, pixelArtRealm in
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
                let pixelArtRealm = PixelArtRealm(from: pixelArt)
                pixelArtRealm._partition = RealmBuilder.user?.id ?? ""
                realm?.add(pixelArtRealm)
            }
            return true
        } catch {
            print("Error adding pixel Art \(error)")
            return false
        }
    }

    func delete(pixelArt: PixelArt) async -> Bool {
        do {
            try realm?.write {
                if let found = realm?.objects(PixelArtRealm.self).filter({ $0.uuid == pixelArt.id })
                {
                    realm?.delete(found)
                }
            }

            return true
        } catch {
            print("Error deleting pixel Art \(error)")
            return false
        }
    }
}
