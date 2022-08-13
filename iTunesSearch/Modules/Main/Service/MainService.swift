//
//  MainService.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MainServiceProtocol: AnyObject {
    typealias SuccessHandler = (SearchAPIResponseModel) -> Void
    typealias FailureHandler = (Error) -> Void
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler)
}

class MainService: MainServiceProtocol {
    
    let networkManager: SearchNetworkManager
    
    init(networkManager: SearchNetworkManager) {
        self.networkManager = networkManager
    }
    
    func getSearchResultFromType(param: SearchAPIRequestModel, success: @escaping SuccessHandler, failure: @escaping FailureHandler) {

        networkManager.getSearchResultFromType(param: param) { result in
            switch result {
            case .success(let responseData):
                success(responseData)
            case .failure(let error):
                failure(error)
            }
        }
    }
}
