//
//  MainPresenterTests.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 3.08.2022.
//

import XCTest
@testable import iTunesSearch

class MainPresenterTests: XCTestCase {
    
    var presenter: MainPresenter?
    var fakeInteractor: FakeMainInteractor = FakeMainInteractor()
    var fakeView: FakeMainView = FakeMainView()
    var fakeCoordinator: FakeMainCoordinator = FakeMainCoordinator()
    
    
    override func setUp() {
        super.setUp()
        
        presenter = MainPresenter(interactor: fakeInteractor, coordinatorProtocol: fakeCoordinator)
        presenter?.view = fakeView
    }
    
    override func tearDown() {
        super.tearDown()
        
        fakeInteractor.resetFlags()
        fakeView.resetFlags()
    }
    
    func testViewDidLoad() {
        presenter?.viewDidLoad()
        
        XCTAssertTrue(fakeView.didConfigureSegmentedControlCalled)
        XCTAssertTrue(fakeView.didConfigureTextFieldCalled)
        XCTAssertTrue(fakeView.didConfigureCollectionViewCalled)
    }
    
    func testRequest() {
        presenter?.requestSearchWithItem(requestModel: SearchAPIRequestModel.init(term: "", media: "", limit: ""))
        
        XCTAssertTrue(fakeInteractor.didRequestCalled)
    }
}
