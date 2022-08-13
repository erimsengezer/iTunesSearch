//
//  SearchCollectionViewSizeCalculator.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit.UIGeometry

struct SearchCollectionViewSizeCalculator {
    
    // MARK: - Constants
    enum Constants {
        enum Size {
            static let itemHeight: CGFloat = 160
        }
    }
    
    // MARK: - Private Properties
    private let width: CGFloat
    
    // MARK: - Public Properties
    var itemSize: CGSize {
        return CGSize(width: width / 2 - 10, height: Constants.Size.itemHeight)
    }
    
    // MARK: - Initializer
    init(width: CGFloat) {
        self.width = width
    }
}

