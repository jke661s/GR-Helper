//
//  Bindable.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class Bindable<T> {
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
}
