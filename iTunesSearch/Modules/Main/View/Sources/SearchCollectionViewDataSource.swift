//
//  SearchCollectionViewDataSource.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit

class SearchCollectionViewDataSource: NSObject {
    
    // MARK: - Private Properties
    private var viewModel: SearchViewModel?
    
    // MARK: - Public Methods
    func update(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
}

extension SearchCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfItems ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.cellIdentifier, for: indexPath) as? SearchCollectionViewCell,
              let itemViewModel = viewModel?.getItemViewModel(indexPath: indexPath) else { return UICollectionViewCell() }
        cell.configureCell(artWorkImageURLString: itemViewModel.artWorkImageURLString, trackName: itemViewModel.trackName, shortDescription: itemViewModel.shortDescription)
        
        return cell
    }
}
