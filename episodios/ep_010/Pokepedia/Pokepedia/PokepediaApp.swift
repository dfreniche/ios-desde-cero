import SwiftUI

@main
struct PokepediaApp: App {
    @State var pokemons: [Pokemon]!
    @State var loaded = false
    
    var body: some Scene {
        WindowGroup {
            if loaded {
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
            } else {
                Text("Loading")
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
