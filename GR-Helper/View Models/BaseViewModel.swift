//
//  BaseViewModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 22/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    fileprivate let ws = WebService.shared
    
    var bindableIsCameraConneted = Bindable<Bool>()
    
    init() {
//        pingCamera()
    }
    
    func pingCamera() {
        ws.request(url: "http://192.168.0.1/v1/ping", method: .get, params: [:]) { [weak self] (_, json, _) in
            guard let self = self else { return }
            self.bindableIsCameraConneted.value = !(json == nil)
            print(self.bindableIsCameraConneted.value)
        }
    }
    
}
