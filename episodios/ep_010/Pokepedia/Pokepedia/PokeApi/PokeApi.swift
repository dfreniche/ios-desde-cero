import SwiftUI

func getPokemons(completion: @escaping ([Pokemon]) -> Void) {
    
    var pokemons: [Pokemon] = []
    
    for i in 50...60 {
        getPokemon("https://pokeapi.co/api/v2/pokemon/\( i )", completion: { pokemon in
            if let pokemon = pokemon {
                
                print("📺 Finished pokemon \(i)")
                
                pokemons.append(pokemon)
                
                completion(pokemons)
            }
        })
    }
}


/// Returns a Pokemon from PokeAPI
/// - Parameters:
///   - pokemonURL: URL to Pokemon. If URL is wrong should return nil Pokemon
///   - completion: this returns a Pokemon (if found and all is OK) in the Main Thread
///  Example
///  ```
///  getPokemon("https://pokeapi.co/api/v2/pokemon/80", completion: { pokemon in
///     completion([ pokemon! ])
///  })
///  ```
func getPokemon(_ pokemonURL: String, completion: @escaping (Pokemon?) -> Void) {
    guard let URL = URL(string: pokemonURL) else { return }
    
    let request = URLRequest(url: URL)
    let session = URLSession.shared
    let task = session.dataTask(with: request) { data, response , error in
        if error == nil,
           let statusCode = (response as? HTTPURLResponse)?.statusCode,
           let data = data {
            // 2 parse JSON
            parsePokemonJSON(data) { pokemon in
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            }
        }
    }
    
    task.resume()
}

func parsePokemonJSON(_ data: Data, completion: (Pokemon?) -> Void) {
    let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data)
    
    completion(pokemon)
}
