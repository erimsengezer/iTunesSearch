//
//  MainInteractorTests.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import XCTest
@testable import iTunesSearch

class MainInteractorTests: XCTestCase {
    var interactor: MainInteractor?
    var fakeMainService: FakeMainService = FakeMainService()
    var fakeMainRepository: FakeMainRepository = FakeMainRepository()
    var fakeInteractorOuttput: FakeMainInteractorOutput = FakeMainInteractorOutput()
    
    override func setUp() {
        interactor = MainInteractor(repository: fakeMainRepository)
        interactor?.output = fakeInteractorOuttput
    }
    
    override func tearDown() {
        super.tearDown()
        
        fakeMainService.resetFlags()
        fakeMainRepository.resetFlags()
        fakeInteractorOuttput.resetFlags()
    }
    
    func testRequestSuccess() {
        self.fakeMainRepository.willSuccess = true
        
        interactor?.getSearchResultFromType(param: SearchAPIRequestModel.init(term: "", media: "", limit: ""))
        
        XCTAssertTrue(fakeInteractorOuttput.didRequestSuccessCalled)
        XCTAssertNotNil(fakeInteractorOuttput.viewModel)
        XCTAssertFalse(fakeInteractorOuttput.didRequestFailureCalled)
    }
    
    func testRequestFailure() {
        self.fakeMainRepository.willSuccess = false
        
        interactor?.getSearchResultFromType(param: SearchAPIRequestModel.init(term: "", media: "", limit: ""))
        
        XCTAssertFalse(fakeInteractorOuttput.didRequestSuccessCalled)
        XCTAssertNil(fakeInteractorOuttput.viewModel)
        XCTAssertTrue(fakeInteractorOuttput.didRequestFailureCalled)
    }
}
