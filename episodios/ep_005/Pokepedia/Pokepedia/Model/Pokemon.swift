import SwiftUI

struct Pokemon {
    let url: URL?
    let color: Color?
}

let pikachuURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")

let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")

let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")

let pokemons = [
    Pokemon(url: pikachuURL, color: Color.yellow),     // 0
    Pokemon(url: bulbasaurURL, color: Color.cyan),   // 1
    Pokemon(url: charmanderURL, color: Color.yellow)   // 2
]
