//
//  DetailInteractor.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol DetailInteractorProtocol {
    var repository: DetailRepositoryProtocol { get }
    var output: DetailInteractorOutputProtocol? { get set }
}

protocol DetailInteractorOutputProtocol: AnyObject {

}

class DetailInteractor: DetailInteractorProtocol {
    
    // MARK: - Public Properties
    let repository: DetailRepositoryProtocol
    weak var output: DetailInteractorOutputProtocol?
    
    // MARK: - Initializer
    init(repository: DetailRepositoryProtocol) {
        self.repository = repository
    }
}
