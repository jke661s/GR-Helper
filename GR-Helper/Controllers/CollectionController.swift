//
//  CollectionController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit
import JGProgressHUD

class CollectionController: BaseController {
    
    // Configuration
    fileprivate let numberOfCellInRow: CGFloat = 4
    fileprivate let minInteritemSpacing: CGFloat = 1
    fileprivate let sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
    fileprivate let minLineSpacing: CGFloat = 1
    
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
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionHeadersPinToVisibleBounds = true
        layout.minimumInteritemSpacing = minInteritemSpacing
        layout.minimumLineSpacing = minLineSpacing
        layout.sectionInset = sectionInset
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    // View Model
    private let collectionViewModel = CollectionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionViewModel.bindableIsRicohWifiConnected.value! ? getPhotoList() : displayConnectionErrorDialog()
    }
    
    // MARK: - private functions
    fileprivate func displayConnectionErrorDialog() {
        let noConnectionView = NoConnectionView()
        self.view.addSubview(noConnectionView)
        noConnectionView.setConstraints(top: self.view.topAnchor, leading: self.view.leadingAnchor, bottom: self.view.bottomAnchor, trailing: self.view.trailingAnchor)
    }
    
    private func getPhotoList() {
        collectionViewModel.getPhotoList { [weak self] (data, json, err) in
            guard let self = self, let json = json else { return }
            self.collectionViewModel.objectModel = ObjectModel(dic: json)
            self.collectionView.reloadData()
        }
    }
    
    fileprivate func setupCollectionView() {
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.cellId)
        collectionView.register(PhotoHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: PhotoHeaderView.headerId)
    }
    
    private func setupLayout() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.contentInset = .init(top: 8, left: 0, bottom: 0, right: 0)
        collectionView.setConstraints(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
}

extension CollectionController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: Delegate
    // Set cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.frame.width - sectionInset.left - sectionInset.right - minInteritemSpacing * (numberOfCellInRow - 1) ) / numberOfCellInRow
        return .init(width: cellWidth, height: cellWidth)
    }
    
    // Set header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 50, height: 20)
    }
    
    // MARK: Data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewModel.groupedPhotoList[section].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewModel.groupedPhotoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotoHeaderView.headerId, for: indexPath) as! PhotoHeaderView
        headerView.label.text = collectionViewModel.groupedPhotoList[indexPath.section].first?.time ?? "N/A"
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.cellId, for: indexPath) as! PhotoCell
        cell.photoCellViewModel.path = collectionViewModel.groupedPhotoList[indexPath.section][indexPath.item].path
        return cell
    }

    
}
