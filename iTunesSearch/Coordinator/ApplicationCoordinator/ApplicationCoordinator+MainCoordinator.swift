//
//  ApplicationCoordinator+MainCoordinator.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//

import UIKit

extension ApplicationCoordinator: MainCoordinatorProtocol {
    func detailScreen(viewModel: CollectionItemViewModel) {
        guard let detailScreen = DetailBuilder.generate(coordinatorProtocol: self, viewModel: viewModel) else { return }
        navigate(detailScreen)
    }
}
