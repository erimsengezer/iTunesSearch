//
//  SearchViewModel.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation


struct SearchViewModel {
    
    // MARK: - Private Properties
    private var response: SearchAPIResponseModel
    
    var numberOfItems: Int {
        return response.results.count
    }
    
    init(response: SearchAPIResponseModel) {
        self.response = response
    }
    
    func getItemViewModel(indexPath: IndexPath) -> CollectionItemViewModel? {
        let item = self.response.results[indexPath.row]
        return CollectionItemViewModel(item: item)
    }
}
