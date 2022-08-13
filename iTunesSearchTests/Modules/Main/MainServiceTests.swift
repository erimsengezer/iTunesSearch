//
//  MainServiceTests.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import XCTest
@testable import iTunesSearch

class MainServiceTests: XCTestCase {
    
    var service: FakeMainService = FakeMainService()
    
    func testRequest() {
        service.getSearchResultFromType(param: SearchAPIRequestModel.init(term: "", media: "", limit: ""), success: { model in
            
            XCTAssertNotNil(model)
            XCTAssertEqual(model.results.count, 1)
            XCTAssertEqual(model.results[0].trackName, "Avengers: Age of Ultron")
            
        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
}
