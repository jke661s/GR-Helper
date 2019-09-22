//
//  PhotoCell.swift
//  GR-Helper
//
//  Created by Jackie Wang on 21/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCell: UICollectionViewCell {
    
    // Configuration
    static let cellId = "photoCellId"
    // UI Components
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    // View model
    var photoCellViewModel = PhotoCellViewModel()
    
    // Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        backgroundColor = .blue
        setupViewModelObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Fileprivate functions
    fileprivate func setupLayout() {
        addSubview(imageView)
        imageView.setConstraints(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    fileprivate func setupViewModelObserver() {
        photoCellViewModel.bindableImageData.bind { [weak self] (data) in
            guard let self = self, let data = data else { return }
            self.imageView.image = UIImage(data: data)
        }
    }
    
}
