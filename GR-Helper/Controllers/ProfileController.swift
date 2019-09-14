//
//  ProfileController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class ProfileController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let tabBarItem = UITabBarItem()
//        tabBarItem.title = "Profile"
//        
//        tabBarItem.image = #imageLiteral(resourceName: "profile")
//        self.tabBarItem = tabBarItem
        
        let label = UILabel()
        label.text = "This is profile controller."
        label.backgroundColor = .yellow
        
        view.addSubview(label)
        label.centerX(to: view)
        label.centerY(to: view)
    }
    
}
