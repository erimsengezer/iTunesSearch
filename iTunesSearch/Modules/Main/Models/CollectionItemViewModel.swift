//
//  CollectionItemViewModel.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit
import Kingfisher

struct CollectionItemViewModel {
    
 // MARK: - Private Properties
    private let item: CollectionModel
    
    init(item: CollectionModel) {
        self.item = item
    }
    
    var artWorkImageURLString: String? {
        return item.artworkUrl100
    }
    
    var trackName: String {
        return item.trackName ?? item.artistName ?? "--"
    }
    
    var shortDescription: String {
        return item.shortDescription ?? item.longDescription ?? "--"
    }
    
    var longDescription: String {
        return item.longDescription ?? ""
    }
}
