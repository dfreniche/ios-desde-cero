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
            // Map showing all Pokemons!
            PokemonMapView(pokemons: pokemons)
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
            
            // Simple view showing pokemons one by one
            PokemonView()
            //                    .badge(getPokemons().count)
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Pokemon")
                }
            
            // A hand-made list of Pokemons
            PokemonSimpleList()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.fill")
                    Text("Simple")
                }
            
            // A List of Pokemons
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
