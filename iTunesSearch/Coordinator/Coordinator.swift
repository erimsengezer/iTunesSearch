//
//  Coordinator.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//

import UIKit

protocol  Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
}
