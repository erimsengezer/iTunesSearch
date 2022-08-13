//
//  FakeMainPresenter.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainPresenter: MainPresenterProtocol, TestProtocol {
    var coordinator: MainCoordinatorProtocol
    
    
    var view: MainViewProtocol?
    
    var interactor: MainInteractorProtocol
    
    var viewModel: SearchViewModel?
    
    // MARK: - Test Properties
    
    var didViewDidLoadCalled: Bool = false
    var didDidSelectItemCalled: Bool = false
    var didRequestCalled: Bool = false
    
    init() {
        self.interactor = FakeMainInteractor()
        self.coordinator = FakeMainCoordinator()
    }
    
    func viewDidLoad() {
        didViewDidLoadCalled = true
    }
    
    func didSelectItem(indexPath: IndexPath) {
        didDidSelectItemCalled = true
    }
    
    func requestSearchWithItem(requestModel: SearchAPIRequestModel) {
        didRequestCalled = true
    }
    
    func resetFlags() {
        didViewDidLoadCalled = false
        didDidSelectItemCalled = false
        didRequestCalled = false
    }
}

class FakeMainCoordinator: MainCoordinatorProtocol {
    func detailScreen(viewModel: CollectionItemViewModel) {
        
    }
}
