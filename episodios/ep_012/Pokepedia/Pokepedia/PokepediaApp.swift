import SwiftUI

@main
struct PokepediaApp: App {
    @State var pokemons: [Pokemon]!
    @State var loaded = false
    
    var body: some Scene {
        WindowGroup {
            if loaded {
                PokemonTabView(pokemons: pokemons)
            } else {
                InitialLoadingView()
                    .onAppear {
                        getPokemons { pokemons in
                            self.pokemons = pokemons
                            loaded = true
                        }
                    }
            }
        }
    }
}
