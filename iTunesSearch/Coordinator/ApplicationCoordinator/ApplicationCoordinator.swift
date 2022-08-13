//
//  ApplicationCoordinator.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//

import UIKit

protocol ApplicationCoordinatorProtocol {
    func start()
}

class ApplicationCoordinator: Coordinator {
    var navigationController: UINavigationController
    let tabBarCoordinator: TabBarCoordinator
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.tabBarCoordinator = TabBarCoordinator()
    }
    
    func start() {
        tabBarCoordinator.start()
        makeRootViewController(self.tabBarCoordinator.tabBarController)
    }
    
    
    private func makeRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator {
    var topViewController: UIViewController? {
        if let navigation = self.tabBarCoordinator.tabBarController.selectedViewController as? UINavigationController,
           let topViewController = navigation.topViewController {
            return topViewController
        } else if let topVC = self.tabBarCoordinator.tabBarController.presentedViewController {
            return topVC
        } else if let topVC = UIApplication.shared.topViewController() {
            return topVC
        } else {
            return nil
        }
    }
    
    func present(_ viewController: UIViewController) {
        topViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func navigate(_ viewControler: UIViewController) {
        topViewController?.navigationController?.pushViewController(viewControler, animated: true)
    }
    
    func popViewController() {
        topViewController?.navigationController?.popViewController(animated: true)
    }
    
    func dismiss() {
        topViewController?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
