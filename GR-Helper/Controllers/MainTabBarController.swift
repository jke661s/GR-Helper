//
//  MainTabBarController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let collectionController = CollectionController()
    private let controlController = ControlController()
    private let profileController = ProfileController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionController.tabBarItem.title = "Collection"
        collectionController.tabBarItem.image = UIImage(named: "collection")
        
        controlController.tabBarItem.title = "Control"
        controlController.tabBarItem.image = UIImage(named: "control")
        
        profileController.tabBarItem.title = "Profile"
        profileController.tabBarItem.image = UIImage(named: "profile")
        
        viewControllers = [collectionController, controlController, profileController]
    }
    
}
