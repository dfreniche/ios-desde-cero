//
//  PokemonSimpleView.swift
//  Pokepedia
//
//  Created by Diego Freniche Brito on 3/3/22.
//

import SwiftUI

// Shows one Pokemon
struct PokemonSimpleView: View {
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
           
            AsyncImage(url: pokemon.url) { pokeImage in
                pokeImage
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                VStack(spacing: 10) {
                    ProgressView()
                    Text("Pokeloading...")
                }
            }
            
            Text(pokemon.name)
                .padding()
                .font(.largeTitle)
                .background(Color("DetailColor"))
                .foregroundColor(pokemon.color)
                .cornerRadius(15)
                .position(x: 100, y: 30)
            
            Text("Type: Earth")
            
        }.background(pokemon.color)
    }
}

struct PokemonSimpleView_Previews: PreviewProvider {
    static let pokemon = Pokemon(id: 1,
                          name: "Otaku",
                          url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png"),
                          color: Color.red)
    
    static var previews: some View {
        PokemonSimpleView(pokemon: pokemon)
    }
}
