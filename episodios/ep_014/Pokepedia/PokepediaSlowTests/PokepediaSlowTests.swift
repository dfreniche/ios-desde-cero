//
//  PokepediaSlowTests.swift
//  PokepediaSlowTests
//
//  Created by Diego Freniche Brito on 24/3/22.
//

import XCTest

@testable
import Pokepedia

class PokepediaSlowTests: XCTestCase {

    func test_Given_ValidPokemonURL_When_CallingGetPokemonAndSucceeds_Then_WeGetValidPokemon() {
        var end = false
        
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/6"
        
        // When
        getPokemon(url) { pokemon in
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual("charizard", pokemon?.name)
            XCTAssertEqual(6, pokemon?.id)
            
            end = true
        }
        
        while (!end) {}
    }

}
