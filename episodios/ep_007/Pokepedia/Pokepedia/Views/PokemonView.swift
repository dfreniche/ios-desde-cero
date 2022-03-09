import SwiftUI


struct PokemonView: View {
    @State var nextPokemonIndex: Int = 0
    @State var pokemons = getPokemons()
    
    var body: some View {
        VStack {
            Spacer()
            
            PokemonDetailView(pokemon: pokemons[nextPokemonIndex])
            
            Divider()

            HStack {
                PokemonButton(title: "👈") {
                    print("Index: \( nextPokemonIndex )")
                    if nextPokemonIndex > 0 {
                        nextPokemonIndex = nextPokemonIndex - 1
                    }
                }
                
                PokemonButton(title: "👉") {
                    print("Index: \( nextPokemonIndex )")
                    if nextPokemonIndex < pokemons.count - 1 {
                        nextPokemonIndex = nextPokemonIndex + 1
                    }
                    
                }
            }
            
            Spacer()
        }
        .background(pokemons[nextPokemonIndex].color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
