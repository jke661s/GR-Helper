//
//  ControlController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit

class ControlController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "This is control controller."
        label.backgroundColor = .purple
        
        view.addSubview(label)
        label.centerX(to: view)
        label.centerY(to: view)
        
    }
    
}
