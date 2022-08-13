//
//  MainViewController.swift
//  iTunesSearch
//
//  Created by Erim Şengezer on 31.07.2022.
//  Copyright (c) 2022 Erim Şengezer All rights reserved.[EC-2021]
//

import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol { get }
    
    func configureCollectionView()
    func configureTextField()
    func configureSegmentedControl()
    func refresh()
    func presentAlert(message: String, title: String)
}

class MainViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak private var searchTextField: UITextField!
    @IBOutlet weak private var segmentedControl: UISegmentedControl!
    @IBOutlet weak private var collectionView: UICollectionView!
    
    
    // MARK: - Public Properties
    let presenter: MainPresenterProtocol
    
    // MARK: - Private Properties
    private var collectionViewDelegate: SearchCollectionViewDelegate?
    private var collectionViewDataSource: SearchCollectionViewDataSource?
    
    // MARK: Initializers
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: .main)
    }
    
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        return nil
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension MainViewController: MainViewProtocol {
    func configureCollectionView() {
        collectionView.register(UINib(nibName: "SearchCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.cellIdentifier)
        
        let delegate = SearchCollectionViewDelegate()
        self.collectionViewDelegate = delegate
        self.collectionViewDataSource = SearchCollectionViewDataSource()
        
        collectionView.delegate = self.collectionViewDelegate
        collectionView.dataSource = self.collectionViewDataSource
        
        self.collectionViewDelegate?.output = self
    }
    
    func configureTextField() {
        self.searchTextField.delegate = self
    }
    
    func configureSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlAction(sender:)), for: .allEvents)
    }
    
    @objc private func segmentedControlAction(sender: UISegmentedControl) {
        if let searchTextFieldText = self.searchTextField.text {
            prepareForRequest(sender: sender, searchText: searchTextFieldText)
        }
    }
    
    private func prepareForRequest(sender: UISegmentedControl, searchText: String) {
        switch sender.selectedSegmentIndex {
        case 0:
            let requestModel = SearchAPIRequestModel(term: searchText, media: MediaType.movie.rawValue, limit: "50")
            presenter.requestSearchWithItem(requestModel: requestModel)
        case 1:
            let requestModel = SearchAPIRequestModel(term: searchText, media: MediaType.music.rawValue, limit: "50")
            presenter.requestSearchWithItem(requestModel: requestModel)
        case 2:
            let requestModel = SearchAPIRequestModel(term: searchText, media: MediaType.software.rawValue, limit: "50")
            presenter.requestSearchWithItem(requestModel: requestModel)
        case 3:
            let requestModel = SearchAPIRequestModel(term: searchText, media: MediaType.ebook.rawValue, limit: "50")
            presenter.requestSearchWithItem(requestModel: requestModel)
        default:
            let requestModel = SearchAPIRequestModel(term: searchText, media: MediaType.movie.rawValue, limit: "50")
            presenter.requestSearchWithItem(requestModel: requestModel)
        }
    }
    
    func refresh() {
        guard let viewModel = presenter.viewModel else { return }
        collectionViewDataSource?.update(viewModel: viewModel)
        
        collectionView.reloadData()
    }
    
    func presentAlert(message: String, title: String = "") {
        showAlert(message: message, title: title)
    }
}

extension MainViewController: SearchCollectionViewDelegateOutput {
    func didSelectItem(at indexPath: IndexPath) {
        presenter.didSelectItem(indexPath: indexPath)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textFieldText = textField.text {
            let finalText = "\(textFieldText)\(string)"
            
            if finalText.count > 2 {
                self.prepareForRequest(sender: self.segmentedControl, searchText: textFieldText)
            }
        }
        return true
    }
}
