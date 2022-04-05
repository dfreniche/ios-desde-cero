import SwiftUI

// Starting point of our App

@main
struct PokepediaApp: App {
    @State var pokemons: [Pokemon]! // gets loaded in onAppear
    @State var loaded = false
    
//#if TESTING
    let isRunningTests = NSClassFromString("XCTestCase") != nil
//#endif

    var body: some Scene {
        WindowGroup {
            if loaded {
                // Tabview with all the main tabs
                PokemonTabView(pokemons: pokemons)
            } else {
                if isRunningTests {
                    Text("Testing Testing 🙈")
                } else {
                    InitialLoadingView()
                        .onAppear {
                            // we load here a page of Pokemon from the API
                            getPokemons { pokemons in
                                self.pokemons = pokemons
                                loaded = true
                            }
                        }
                }
            }
        }
    }
}
