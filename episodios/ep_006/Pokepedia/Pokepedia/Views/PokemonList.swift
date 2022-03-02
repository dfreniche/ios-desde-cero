//
//  PokemonList.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 1/3/22.
//

import SwiftUI

struct PokemonList: View {
    let pokemons = getPokemons()
    
    var body: some View {
        List(pokemons) { pokemon in
            PokemonSimpleView(pokemon: pokemon)
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList()
    }
}
