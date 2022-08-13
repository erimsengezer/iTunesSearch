//
//  MainRepository.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MainRepositoryProtocol {
    typealias SuccessHandler = (SearchAPIResponseModel) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}

class MainRepository: MainRepositoryProtocol {
    
    // MARK: - Properties
    let service: MainServiceProtocol
    
    // MARK: - Initializer
    init(service: MainServiceProtocol) {
        self.service = service
    }
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        service.getSearchResultFromType(param: param, success: { response in
            success(response)
        }, failure: failure)
    }
}
