import XCTest
import Pokepedia

class PokepediaTests: XCTestCase {

    func test_Given_JustCreatedPage_Then_ItStartsIn1() {
        // Given
        let page = Page()
        
        // When
        
        // Then
        XCTAssertEqual(1, page.start)
    }
    
    func test_Given_Page_When_MovingForward_Then_MovesPageSizeRecords() {
        // Given
        let page = Page()
        
        // When
        let pageMoved = page.next()
        
        // Then
        XCTAssertEqual(11, pageMoved.start)
    }
    
    func test_Given_Page_When_MovingBackwards_Then_StartIsAlwaysGreaterThanZero() {
        // Given
        let page = Page()
        
        // When
        let pageMoved = page.previous()
        
        // Then
        XCTAssertEqual(1, pageMoved.start)
    }
}
