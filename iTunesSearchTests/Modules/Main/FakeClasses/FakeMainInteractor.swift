//
//  Interactor.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainInteractor: MainInteractorProtocol, TestProtocol {
    
    var repository: MainRepositoryProtocol
    
    var output: MainInteractorOutputProtocol?
    
    var didRequestCalled: Bool = false
    
    init() {
        self.repository = FakeMainRepository()
        self.output = FakeMainInteractorOutput()
    }
    
    func getSearchResultFromType(param: SearchAPIRequestModel) {
        didRequestCalled = true
    }
    
    func resetFlags() {
        didRequestCalled = false
    }
}
