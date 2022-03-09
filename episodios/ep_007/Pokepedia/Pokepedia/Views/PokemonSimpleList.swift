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

struct PokemonSimpleList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSimpleList()
    }
}
