//
//  SearchCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier: String = "SearchCollectionViewCell"
    
    @IBOutlet weak private var artWorkImageView: UIImageView!
    @IBOutlet weak private var trackNameLabel: UILabel!
    @IBOutlet weak private var shortDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(artWorkImageURLString: String?, trackName: String, shortDescription: String) {
        imageViewSetImage(urlString: artWorkImageURLString)
        self.trackNameLabel.text = trackName
        self.shortDescriptionLabel.text = shortDescription
    }
    
    private func imageViewSetImage(urlString: String?) {
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        artWorkImageView.kf.setImage(with: url)
    }

}
