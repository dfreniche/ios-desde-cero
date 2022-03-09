import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
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
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static let pokemon = Pokemon(id: 1,
                          name: "Otaku",
                          url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png"),
                          color: Color.red)
    
    static var previews: some View {
        
        PokemonDetailView(pokemon: pokemon)
    }
}
