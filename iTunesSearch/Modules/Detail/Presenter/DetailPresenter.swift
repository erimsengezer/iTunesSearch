//
//  DetailPresenter.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol DetailPresenterProtocol {
    var view: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol { get }
    var coordinator: MainCoordinatorProtocol { get }
    
    func viewDidLoad()
}

class DetailPresenter: DetailPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: DetailInteractorProtocol
    let coordinator: MainCoordinatorProtocol
    weak var view: DetailViewProtocol?
    
    let viewModel: CollectionItemViewModel
    
    // MARK: - Initializer
    init(interactor: DetailInteractorProtocol, coordinatorProtocol: MainCoordinatorProtocol, viewModel: CollectionItemViewModel) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
        self.viewModel = viewModel
    }
    
    func viewDidLoad() {
        configureView(viewModel: self.viewModel)
    }
    
    func viewWillAppear() {}
    
    func configureView(viewModel: CollectionItemViewModel) {
        view?.configureView(viewModel: viewModel)
    }
}


extension DetailPresenter: DetailInteractorOutputProtocol {
    
}

