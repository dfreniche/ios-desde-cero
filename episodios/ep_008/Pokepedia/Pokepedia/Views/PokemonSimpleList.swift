import SwiftUI

struct PokemonSimpleList: View {
    
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(pokemons) { pokemon in
                    PokemonSimpleView(pokemon: pokemon)
                }
            }
        }.onAppear {
            getPokemons { pokemons in
                self.pokemons = pokemons
            }
        }
    }
}

struct PokemonSimpleList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSimpleList()
    }
}
