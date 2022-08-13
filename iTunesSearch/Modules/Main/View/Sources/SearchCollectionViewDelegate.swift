//
//  SearchCollectionViewDelegate.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit

protocol SearchCollectionViewDelegateOutput: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

class SearchCollectionViewDelegate: NSObject {
    
    // MARK: - Public Properties
    weak var output: SearchCollectionViewDelegateOutput?
}

extension SearchCollectionViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output?.didSelectItem(at: indexPath)
    }
}

extension SearchCollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SearchCollectionViewSizeCalculator(width: collectionView.frame.width).itemSize
    }
}
