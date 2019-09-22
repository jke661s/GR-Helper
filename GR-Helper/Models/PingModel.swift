//
//  PingModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 22/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class PingModel {
    var errCode: Int?
    var errMsg: String?
    var datetime: String?
    
    init(dictionary: [String: Any]) {
        self.errCode = dictionary["errCode"] as? Int ?? 0
        self.errMsg = dictionary["errMsa"] as? String ?? "N/A"
        self.datetime = dictionary["datatime"] as? String ?? "N/A"
    }
}
