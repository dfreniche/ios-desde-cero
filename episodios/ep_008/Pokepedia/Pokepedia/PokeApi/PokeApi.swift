//
//  PokeApi.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 1/3/22.
//

import SwiftUI

// Stub
func getPokemons(completion: ([Pokemon]) -> Void) {    
    getPokemon("https://pokeapi.co/api/v2/pokemon/80", completion: { pokemon in
        completion([ pokemon! ])
    })
}

func getPokemon(_ pokemonURL: String, completion: (Pokemon?) -> Void) {
    // 1. download pokemon from URL: https://pokeapi.co/api/v2/pokemon/80
    let data = Data(pokemon1JSON.utf8)
    
    // 2 parse JSON
    parsePokemonJSON(data) { pokemon in
       completion(pokemon)
    }
}

func parsePokemonJSON(_ data: Data, completion: (Pokemon?) -> Void) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    
    completion(pokemon)
}
