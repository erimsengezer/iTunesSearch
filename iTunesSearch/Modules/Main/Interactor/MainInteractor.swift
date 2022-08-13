//
//  MainInteractor.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol MainInteractorProtocol {
    var repository: MainRepositoryProtocol { get }
    var output: MainInteractorOutputProtocol? { get set }
    
    func getSearchResultFromType(param: SearchAPIRequestModel)
}

protocol MainInteractorOutputProtocol: AnyObject {
    func didGetSearchResultSuccess(viewModel: SearchViewModel)
    func didGetSearchResultFailure(error: Error)
}

class MainInteractor: MainInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: MainRepositoryProtocol
    weak var output: MainInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: MainRepositoryProtocol) {
        self.repository = repository
    }
    
    func getSearchResultFromType(param: SearchAPIRequestModel) {
        repository.getSearchResultFromType(param: param, success: { [weak self] response in
            let viewModel = SearchViewModel(response: response)
            self?.output?.didGetSearchResultSuccess(viewModel: viewModel)
        }, failure: { [weak self] error in
            self?.output?.didGetSearchResultFailure(error: error)
        })
    }
}
