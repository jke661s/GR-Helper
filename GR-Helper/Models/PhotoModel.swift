//
//  PhotoModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 21/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class PhotoModel {
    var time: String?
    var path: String?
    
    init(dictionary: [String: Any]) {
        self.time = dictionary["time"] as? String ?? "N/A"
        self.path = dictionary["path"] as? String ?? "N/A"
    }
}
