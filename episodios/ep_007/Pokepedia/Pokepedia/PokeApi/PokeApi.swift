//
//  PokeApi.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 1/3/22.
//

import SwiftUI

// Stub
func getPokemons() ->[Pokemon] {
    let pikachuURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")
    let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")
    let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")

    let pokemons = [
        Pokemon(id: 1, name: "Pikachu", url: pikachuURL, color: Color.yellow),     // 0
        Pokemon(id: 2, name: "Bulbasaur", url: bulbasaurURL, color: Color.cyan),   // 1
        Pokemon(id: 3, name: "Charmarder", url: charmanderURL, color: Color.yellow),   // 2
        Pokemon(id: 4, name: "Pikachu 2", url: pikachuURL, color: Color.orange),     // 0
        Pokemon(id: 5, name: "Bulbasaur 2", url: bulbasaurURL, color: Color.blue),   // 1
        Pokemon(id: 6, name: "Charmarder 2", url: charmanderURL, color: Color.red),   // 2
        Pokemon(id: 7, name: "Pikachu 2", url: pikachuURL, color: Color.orange),     // 0
        Pokemon(id: 8, name: "Bulbasaur 2", url: bulbasaurURL, color: Color.blue),   // 1
        Pokemon(id: 9, name: "Charmarder 2", url: charmanderURL, color: Color.red)   // 2
    ]
    
    return pokemons
}
