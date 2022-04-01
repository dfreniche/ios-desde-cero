import XCTest

@testable
import Pokepedia

class ParseTests: XCTestCase {

    func test_Given_EmptyData_When_Parsing_Then_ReturnsNilPokemon() {
        // Given
        let emptyData = Data()
        
        // When
        parsePokemonJSON(emptyData) { pokemon in
            
            // Then
            XCTAssertNil(pokemon)
        }
    }
    
    func test_Given_ValidData_When_Parsing_Then_ReturnsNonNilPokemon() {
        // Given
        let data = Data(pokemon1JSON.utf8)
        
        // When
        parsePokemonJSON(data) { pokemon in
            
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual(pokemon?.name, "squirtle")

        }
    }
    
    func test_Given_DataWithEmptyName_When_Parsing_Then_ReturnsNonNilPokemonWithEmptyName() {
        // Given
        let data = Data(pokemon2JSON.utf8)
        
        // When
        parsePokemonJSON(data) { pokemon in
            
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual(pokemon?.name, "")

        }
    }
}
