import SwiftUI

struct Pokemon: Identifiable, Decodable {
    struct Sprite: Decodable {
        struct Other: Decodable {
            struct Artwork: Decodable {
                let frontDefault: String
                
                enum CodingKeys: String, CodingKey {
                    case frontDefault = "front_default"
                }
            }
            
            let officialArtwork: Artwork
            
            enum CodingKeys: String, CodingKey {
                case officialArtwork = "official-artwork"
            }
        }
        
        let other: Other
    }
    
    struct PokeType: Decodable {
        struct InnerPokeType: Decodable {
            let name: String
            let url: String
        }
        
        let type: InnerPokeType
    }
    
    let id: Int         // because ForEach
    let name: String
    let weight: Int
    let sprites: Sprite
    let types: [PokeType]
    
    // TODO: generar
    var url: URL? {
        URL(string: sprites.other.officialArtwork.frontDefault)
    }
    
    var color: Color? {
        if types[0].type.name == "earth" {
            return Color.brown
        } else if types[0].type.name == "bug" {
            return Color.purple
        } else if types[0].type.name == "air" {
            return Color.cyan
        }
        
        return Color.gray
    }
}
