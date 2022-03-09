import SwiftUI

@main
struct PokepediaApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PokemonView()
                    .badge(getPokemons().count)
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Pokemon")
                    }
                PokemonSimpleList()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.fill")
                        Text("Simple")
                    }
                PokemonList()
                    .tabItem {
                        Image(systemName: "list.bullet.circle.fill")
                        Text("List")
                    }
            }
            .font(.headline)
        }
    }
}
