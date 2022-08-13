//
//  DetailRepository.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
// 

import Foundation

protocol DetailRepositoryProtocol {
    
}

class DetailRepository: DetailRepositoryProtocol {
    // MARK: - Properties
    let service: DetailServiceProtocol
    
    // MARK: - Initializer
    init(service: DetailServiceProtocol) {
        self.service = service
    }
}
