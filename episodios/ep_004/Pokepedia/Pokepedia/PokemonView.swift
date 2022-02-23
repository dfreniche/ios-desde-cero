import SwiftUI

let pikachuURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png")

let bulbasaurURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png")

let charmanderURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png")

let pokemons = [
    pikachuURL,     // 0
    bulbasaurURL,   // 1
    charmanderURL   // 2
]

let pokemonColors = [
    Color.yellow,
    Color.cyan,
    Color.red
]

struct PokemonView: View {
    @State var nextPokemonIndex: Int = 0
    
    var body: some View {
        VStack {
            AsyncImage(url: pokemons[nextPokemonIndex])
            
            Divider()

            HStack {
                PokemonButton(title: "👈") {
                    print("Index: \( nextPokemonIndex )")
                    if nextPokemonIndex > 0 {
                        nextPokemonIndex = nextPokemonIndex - 1
                    }
                }.background(Color("PikachuColor"))
                
                PokemonButton(title: "👉") {
                    print("Index: \( nextPokemonIndex )")
                    if nextPokemonIndex < pokemons.count - 1 {
                        nextPokemonIndex = nextPokemonIndex + 1
                    }
                    
                }
            }
        }
        .background(pokemonColors[nextPokemonIndex])
    }
}

struct PokemonButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .padding(40.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
