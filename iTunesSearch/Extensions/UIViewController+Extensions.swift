//
//  UIViewController+Extensions.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 2.08.2022.
//

import UIKit

extension UIViewController {
    func showAlert(message: String,  title: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        
        self.present(alert, animated: true)
    }
}
