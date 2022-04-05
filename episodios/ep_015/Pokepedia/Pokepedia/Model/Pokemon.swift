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
    
    enum PokemonType: String {
        case grass
        case poison
        case fire
        case water
        case air
        case bug
        case normal
        case electric
    }
    
    var color: Color? {
        
        let pokemonType : String = types[0].type.name
        switch PokemonType(rawValue: pokemonType) {
        case .grass, .normal:
            return Color.green
        case .poison, .bug:
            return Color.purple
        case .fire:
            return Color.red
        case .water:
            return Color.blue
        case .air:
            return Color.cyan
        case .electric:
            return Color.yellow
        default:
            return Color.gray
        }
    }
}
