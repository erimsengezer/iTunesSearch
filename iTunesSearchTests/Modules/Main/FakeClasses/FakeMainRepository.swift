//
//  FakeMainRepository.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainRepository: MainRepositoryProtocol, TestProtocol {
    
    var service: MainServiceProtocol
    
    var didRequestCalled: Bool = false
    var willSuccess: Bool = false
    
    init() {
        self.service = FakeMainService()
    }
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        didRequestCalled = true
        
        guard let service = service as? FakeMainService else { return }
        
        service.willSuccess = willSuccess
        
        service.getSearchResultFromType(param: param, success: { model in
            success(model)
        }, failure: { error in
            failure(error)
        })
    }
    
    func resetFlags() {
        didRequestCalled = false
        willSuccess = false
    }
}
