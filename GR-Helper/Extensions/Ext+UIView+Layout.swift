//
//  Ext+UIView+Layout.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func setConstraints(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraint {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let anchoredConstraint = AnchoredConstraint()
        
        if let top = top {
            anchoredConstraint.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraint.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraint.bottom = bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraint.trailing = trailing.constraint(equalTo: trailing, constant: padding.right)
        }
        
        if size.height != 0 {
            anchoredConstraint.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        if size.width != 0 {
            anchoredConstraint.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        [anchoredConstraint.top, anchoredConstraint.leading, anchoredConstraint.bottom, anchoredConstraint.leading, anchoredConstraint.width, anchoredConstraint.height].forEach({ $0?.isActive = true})
        
        return anchoredConstraint
    }
    
    func centerX(to view: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: padding).isActive = true
    }
    
    func centerY(to view: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: padding).isActive = true
    }
    
}
