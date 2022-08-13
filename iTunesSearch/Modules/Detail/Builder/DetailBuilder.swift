//
//  DetailBuilder.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit

enum DetailBuilder {
    
    static func generate(coordinatorProtocol: MainCoordinatorProtocol, viewModel: CollectionItemViewModel) -> UIViewController? {
        let service: DetailServiceProtocol = DetailService()
        let repository: DetailRepositoryProtocol = DetailRepository(service: service)
        var interactor: DetailInteractorProtocol = DetailInteractor(repository: repository)
        var presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter(interactor: interactor,
                                                                                                  coordinatorProtocol: coordinatorProtocol,
                                                                                                  viewModel: viewModel)
        let view: DetailViewProtocol = DetailViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
