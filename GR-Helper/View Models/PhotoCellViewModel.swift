//
//  PhotoCellViewModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 21/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class PhotoCellViewModel {
    
    fileprivate let photoWS = PhotoWebService.shared
    var path: String? {
        didSet {
            getImage()
        }
    }
    var bindableImageData = Bindable<Data>()
    
    
    
    fileprivate func getImage() {
        let urlString = "http://192.168.0.1/v1/photos\(path ?? "")"
        photoWS.getImage(url: urlString, size: .view, completion: { [weak self] (data) in
            guard let self = self, let data = data else { return }
            self.bindableImageData.value = data
        })
    }
}
