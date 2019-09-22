//
//  BaseController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    // View controller
    fileprivate let baseViewModel = BaseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
}
