//
//  AlertView.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class NoConnectionView: UIView {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .init(white: 0.65, alpha: 1)
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 7
        view.clipsToBounds = true
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "No camera connection. Please go to settings to connect."
        label.numberOfLines = 0
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Go to settings", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(backgroundView)
        backgroundView.addSubview(contentView)
        contentView.addSubview(label)
        contentView.addSubview(button)
        
        backgroundView.setConstraints(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        contentView.setConstraints(top: nil, leading: backgroundView.leadingAnchor, bottom: nil, trailing: backgroundView.trailingAnchor, padding: .init(top: 0, left: 18, bottom: 0, right: -18), size: .init(width: 0, height: 0))
        contentView.centerY(to: backgroundView)
        
        label.setConstraints(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 26, left: 18, bottom: 0, right: -18), size: .init(width: 0, height: 0))
        label.centerX(to: contentView)
        
        button.setConstraints(top: label.bottomAnchor, leading: nil, bottom: contentView.bottomAnchor, trailing: nil, padding: .init(top: 15, left: 0, bottom: -15, right: 0))
        button.centerX(to: contentView)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
