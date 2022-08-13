//
//  MainWireframe.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//

import UIKit

protocol MainWireframeProtocol: AnyObject {
    var coordinatorProtocol: MainCoordinatorProtocol { get }
    init(coordinatorProtocol: MainCoordinatorProtocol)
    
    func detailScreen(viewModel: CollectionItemViewModel)
}

class MainWireframe: MainWireframeProtocol {
    
    var coordinatorProtocol: MainCoordinatorProtocol
    
    required init(coordinatorProtocol: MainCoordinatorProtocol) {
        self.coordinatorProtocol = coordinatorProtocol
    }
    
    func detailScreen(viewModel: CollectionItemViewModel) {
        self.coordinatorProtocol.detailScreen(viewModel: viewModel)
    }
}
