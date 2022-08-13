//
//  MainBuilder.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 All rights reserved.[EC-2021]
// 

import UIKit
import Moya

enum MainBuilder {
    
    static func generate(coordinatorProtocol: MainCoordinatorProtocol) -> UIViewController? {
        let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
        let provider = MoyaProvider<SearchAPI>(plugins: [plugin])
        
        let networkManager = SearchNetworkManager(searchProvider: provider)
        let service: MainServiceProtocol = MainService(networkManager: networkManager)
        let repository: MainRepositoryProtocol = MainRepository(service: service)
        var interactor: MainInteractorProtocol = MainInteractor(repository: repository)
        var presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter(interactor: interactor, coordinatorProtocol: coordinatorProtocol)
        let view: MainViewProtocol = MainViewController(presenter: presenter)
        
        presenter.view = view
        interactor.output = presenter
        
        return view as? UIViewController
    }
}
