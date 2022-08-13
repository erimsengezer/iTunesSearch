//
//  MainRepositoryTests.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import XCTest
@testable import iTunesSearch

class MainRepositoryTests: XCTestCase {
    
    var repository: MainRepository?
    var fakeService: FakeMainService = FakeMainService()
    
    
    override func setUp() {
        repository = MainRepository(service: fakeService)
    }
    
    func testRequestSuccess() {
        fakeService.willSuccess = true
        
        fakeService.getSearchResultFromType(param: SearchAPIRequestModel.init(term: "", media: "", limit: ""), success: { model in
            XCTAssertNotNil(model)
            XCTAssertEqual(model.results.count, 1)
            XCTAssertEqual(model.results[0].trackName, "Avengers: Age of Ultron")
            
        }, failure: { error in
            XCTFail()
        })
    }
}
