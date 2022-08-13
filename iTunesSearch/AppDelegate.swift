//
//  AppDelegate.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: ApplicationCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }

        self.coordinator = ApplicationCoordinator(window: window)
        self.coordinator?.start()
        return true
    }
}

