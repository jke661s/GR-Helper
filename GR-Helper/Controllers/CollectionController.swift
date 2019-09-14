//
//  CollectionController.swift
//  GR-Helper
//
//  Created by Jackie Wang on 14/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

class CollectionController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let label = UILabel()
        label.text = "This is collection controller."
        label.backgroundColor = .gray
        label.font = UIFont.systemFont(ofSize: 32)
        
        view.addSubview(label)
        label.centerX(to: view)
        label.centerY(to: view)
        
        if let ssid = getWiFiSsid() {
            label.text = "WiFi SSID is: \(ssid)"
        }
        
    }
    
    func getWiFiSsid() -> String? {
        var ssid: String?
        if let interfaces = CNCopySupportedInterfaces() as NSArray? {
            for interface in interfaces {
                if let interfaceInfo = CNCopyCurrentNetworkInfo(interface as! CFString) as NSDictionary? {
                    ssid = interfaceInfo[kCNNetworkInfoKeySSID as String] as? String
                    break
                }
            }
        }
        return ssid
    }
    
}
