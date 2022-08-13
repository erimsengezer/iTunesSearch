//
//  MainPresenter.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//
import Foundation

protocol MainPresenterProtocol {
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorProtocol { get }
    var coordinator: MainCoordinatorProtocol { get }
    
    var viewModel: SearchViewModel? { get }
    
    func viewDidLoad()
    func didSelectItem(indexPath: IndexPath)
    func requestSearchWithItem(requestModel: SearchAPIRequestModel)
    
}

class MainPresenter: MainPresenterProtocol {
    
    // MARK: - Public Properties
    let interactor: MainInteractorProtocol
    let coordinator: MainCoordinatorProtocol
    weak var view: MainViewProtocol?
    
    var viewModel: SearchViewModel?
    
    // MARK: - Initializer
    init(interactor: MainInteractorProtocol, coordinatorProtocol: MainCoordinatorProtocol) {
        self.interactor = interactor
        self.coordinator = coordinatorProtocol
    }
    
    func viewDidLoad() {
        view?.configureCollectionView()
        view?.configureTextField()
        view?.configureSegmentedControl()
    }
    
    
    func viewWillAppear() {}
    
    func didSelectItem(indexPath: IndexPath) {
        guard let itemViewModel = viewModel?.getItemViewModel(indexPath: indexPath) else { return }
        coordinator.detailScreen(viewModel: itemViewModel)
    }
    
    func requestSearchWithItem(requestModel: SearchAPIRequestModel) {
        interactor.getSearchResultFromType(param: requestModel)
    }
}


extension MainPresenter: MainInteractorOutputProtocol {
    func didGetSearchResultSuccess(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        view?.refresh()
    }
    
    func didGetSearchResultFailure(error: Error) {
        view?.presentAlert(message: error.localizedDescription, title: "Error !")
    }
}

