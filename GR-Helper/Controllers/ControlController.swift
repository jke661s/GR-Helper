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
        
//        let tabBarItem = UITabBarItem()
//        tabBarItem.title = "Control"
//        tabBarItem.image = #imageLiteral(resourceName: "control")
//        self.tabBarItem = tabBarItem
        
        let label = UILabel()
        label.text = "This is control controller."
        label.backgroundColor = .purple
        
        view.addSubview(label)
        label.centerX(to: view)
        label.centerY(to: view)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
