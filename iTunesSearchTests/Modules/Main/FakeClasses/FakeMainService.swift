//
//  FakeMainService.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainService: MainServiceProtocol, TestProtocol {

    var willSuccess: Bool = false
    var didRequestCalled: Bool = false
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        self.didRequestCalled = true
        
        if willSuccess {
            guard let model: SearchAPIResponseModel = Utils.convertFrom(fileName: "movie") else {
                let error = NSError(domain: "Convert Error", code: 0000, userInfo: nil) as Error
                failure(error)
                return
            }
            
            success(model)
        } else {
            let error = NSError(domain: "Error Case", code: 0000, userInfo: nil) as Error
            failure(error as NSError)
        }
    }
    
    func resetFlags() {
        willSuccess = false
        didRequestCalled = false
    }
}
