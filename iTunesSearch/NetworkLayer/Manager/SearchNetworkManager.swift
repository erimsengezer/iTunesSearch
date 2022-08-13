//
//  SearchNetworkManager.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Moya

protocol SearchNetworkManagerProtocol {
    func getSearchResultFromType(param: SearchAPIRequestModel, completion: @escaping (Result<SearchAPIResponseModel, Error>) -> ())
}

class SearchNetworkManager: BaseManager<SearchAPI, MoyaProvider<SearchAPI>>, SearchNetworkManagerProtocol {
    
    override init(searchProvider: MoyaProvider<SearchAPI>) {
        super.init(searchProvider: searchProvider)
    }

    func getSearchResultFromType(param: SearchAPIRequestModel, completion: @escaping (Result<SearchAPIResponseModel, Error>) -> ()) {
        request(target: .getSearchResultFromType(param: param), completion: completion)
    }
}
