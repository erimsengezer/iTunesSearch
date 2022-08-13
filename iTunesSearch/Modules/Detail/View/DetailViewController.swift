//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit
import Kingfisher

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol { get }
    
    func configureView(viewModel: CollectionItemViewModel)
}

class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    // MARK: - Public Properties
    let presenter: DetailPresenterProtocol
    
    // MARK: - Private Properties
    
    // MARK: Initializers
    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: .main)
    }
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        return nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension DetailViewController: DetailViewProtocol {
    func configureView(viewModel: CollectionItemViewModel) {
        guard let imageUrlString = viewModel.artWorkImageURLString else { return }
        guard let imageUrl = URL(string: imageUrlString) else { return }
        imageView.kf.setImage(with: imageUrl)
        
        titleLabel.text = viewModel.trackName
        descriptionLabel.text = viewModel.longDescription
    }
}



