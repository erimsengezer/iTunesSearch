//
//  FakeMainInteractorOutput.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainInteractorOutput: MainInteractorOutputProtocol, TestProtocol {
    
    var didRequestSuccessCalled: Bool = false
    var didRequestFailureCalled: Bool = false
    
    var viewModel: SearchViewModel?
    
    func didGetSearchResultSuccess(viewModel: SearchViewModel) {
        didRequestSuccessCalled = true
        self.viewModel = viewModel
    }
    
    func didGetSearchResultFailure(error: Error) {
        didRequestFailureCalled = true
    }
    
    func resetFlags() {
        didRequestSuccessCalled = false
        didRequestFailureCalled = false
        viewModel = nil
    }
}
