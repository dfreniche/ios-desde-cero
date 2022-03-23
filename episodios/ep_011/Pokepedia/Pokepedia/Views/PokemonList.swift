//
//  PokemonList.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 1/3/22.
//

import SwiftUI

struct PokemonList: View {
    let pokemons: [Pokemon]!
    
    init(pokemons: [Pokemon]) {
        self.pokemons = pokemons
    }
    
    var body: some View {
        NavigationView {
            List(pokemons) { pokemon in
                NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                    // this is the "cell
                    PokemonSimpleView(pokemon: pokemon)
                }
            }
            .navigationTitle("Pokemons")
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(pokemons: [])
    }
}
