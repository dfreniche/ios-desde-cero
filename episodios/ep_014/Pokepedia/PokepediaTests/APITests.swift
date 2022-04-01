//
//  APITests.swift
//  PokepediaTests
//
//  Created by Diego Freniche Brito on 31/3/22.
//

import XCTest

@testable
import Pokepedia


class TestURLSession: URLSession {
    enum TestURLSessionMode {
        case fail
        case pokemon7
        case emptyData
    }
    
    var testMode: TestURLSessionMode
    
    init(testMode: TestURLSessionMode) {
        self.testMode = testMode
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        switch testMode {
        case .fail:
            completionHandler(nil, nil, nil)
        case .pokemon7:
            completionHandler(Data(pokemon2JSON.utf8), HTTPURLResponse(url: URL(string: "http://www.mongodb.com")!, statusCode: 200, httpVersion: "1.1", headerFields: nil), nil)
        case .emptyData:
            completionHandler(nil, nil, nil)
        }

        return TestURLSessionDataTask()
    }
}

class TestURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        print("Called resume!")
    }
}

class APITests: XCTestCase {

    func test_Given_ValidPokemonURL_When_CallingGetPokemonButFails_Then_WeGetNilPokemon() {
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/80"
        
        // When
        getPokemon(url, session: TestURLSession(testMode: .fail)) { pokemon in
            // Then
            XCTAssertNil(pokemon)
        }
    }
    
    func test_Given_ValidPokemonURL_When_CallingGetPokemonAndSucceeds_Then_WeGetValidPokemon() {
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/80"
        
        // When
        getPokemon(url, session: TestURLSession(testMode: .pokemon7)) { pokemon in
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual("", pokemon?.name)
            XCTAssertEqual(7, pokemon?.id)
        }
    }

}
