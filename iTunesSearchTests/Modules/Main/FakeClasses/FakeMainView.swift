//
//  FakeMainView.swift
//  iTunesSearchTests
//
//  Created by Erim Şengezer on 2.08.2022.
//

import Foundation
@testable import iTunesSearch

class FakeMainView: MainViewProtocol, TestProtocol {
    var presenter: MainPresenterProtocol
    
    var didConfigureCollectionViewCalled: Bool = false
    var didConfigureTextFieldCalled: Bool = false
    var didConfigureSegmentedControlCalled: Bool = false
    var didpresentAlertCalled: Bool = false
    var didrefreshCalled: Bool = false
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    init() {
        self.presenter = FakeMainPresenter()
    }
    
    func configureCollectionView() {
        didConfigureCollectionViewCalled = true
    }
    
    func configureTextField() {
        didConfigureTextFieldCalled = true
    }
    
    func configureSegmentedControl() {
        didConfigureSegmentedControlCalled = true
    }
    
    func refresh() {
        didrefreshCalled = true
    }
    
    func presentAlert(message: String, title: String) {
        didpresentAlertCalled = true
    }
    
    func resetFlags() {
        didConfigureCollectionViewCalled = false
        didConfigureTextFieldCalled = false
        didConfigureSegmentedControlCalled = false
        didpresentAlertCalled = false
        didrefreshCalled = false
    }
}
