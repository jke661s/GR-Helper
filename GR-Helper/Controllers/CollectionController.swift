//
//  CollectionController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit
//import SystemConfiguration.CaptiveNetwork
import JGProgressHUD

class CollectionController: BaseController {
    
    // UI Components
    private let label: UILabel = {
        let label = UILabel()
        label.text = "This is collection controller."
        label.backgroundColor = .gray
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: .init())
    // View Model
    private let collectionViewModel = CollectionViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupViewModelObserver()
        checkConnection()
        
    }
    
    // MARK:- private functions
    private func checkConnection() {
        collectionViewModel.checkCameraConnection { [weak self] (data, json, err) in
            guard let self =  self else { return }
            if let err = err {
                let noConnectionView = NoConnectionView()
                self.view.addSubview(noConnectionView)
                noConnectionView.setConstraints(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
                print(err)
                return
            }
            if let json = json {
                self.collectionViewModel.objectModel = ObjectModel(dic: json)
            }
        }
    }
    
    private func setupViewModelObserver() {
        collectionViewModel.bindablePhotoList.bind { [weak self] (photoList) in
            guard let self = self, let photoList = photoList else { return }
            photoList.forEach({print("Path is \($0.path), time is \($0.time)")})
        }
        
        
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.setConstraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
}

extension CollectionController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 50, height: 50)
    }
    
}
