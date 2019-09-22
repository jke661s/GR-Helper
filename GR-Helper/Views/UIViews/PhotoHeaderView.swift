//
//  PhotoHeaderView.swift
//  GR-Helper
//
//  Created by Jackie Wang on 21/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class PhotoHeaderView: UICollectionReusableView {
    static let headerId = "photoHeaderViewId"
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        backgroundColor = .white
        
        label.setConstraints(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 16, bottom: 0, right: 0), size: .init(width: 0, height: 16))
        label.centerY(to: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
