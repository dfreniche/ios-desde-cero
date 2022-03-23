//
//  PokemonTabView.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 22/3/22.
//

import SwiftUI

struct PokemonTabView: View {
    @State var pokemons: [Pokemon]
    
    var body: some View {
        TabView {
            PokemonView()
            //                    .badge(getPokemons().count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokemon")
                }
            PokemonSimpleList()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.fill")
                    Text("Simple")
                }
            PokemonList(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "list.bullet.circle.fill")
                    Text("List")
                }
        }
        .font(.headline)
    }
}

struct PokemonTabView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTabView(pokemons: [])
    }
}
