import SwiftUI

struct PokemonSimpleList: View {
    
    let pokemons = getPokemons()
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(pokemons) { pokemon in
                    PokemonSimpleView(pokemon: pokemon)
                }
            }
        }
    }
}

// Shows one Pokemon
struct PokemonSimpleView: View {
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Text(pokemon.name)
                .font(.largeTitle)
            
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
        }.background(pokemon.color)
    }
}

struct PokemonSimpleList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSimpleList()
    }
}
