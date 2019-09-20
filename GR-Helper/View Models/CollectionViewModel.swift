//
//  CollectionViewModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation
import Alamofire

class PhotoModel {
    var time: String?
    var path: String?
    
    init(dictionary: [String: Any]) {
        self.time = dictionary["time"] as? String ?? "N/A"
        self.path = dictionary["path"] as? String ?? "N/A"
    }
}

class CollectionViewModel {
    
    private let ws = WebService.shared
    
    var objectModel: ObjectModel! {
        didSet {
            var photoList = [PhotoModel]()
            objectModel.dirs.forEach { (dir) in
                dir.files.forEach({ (file) in
                    let time = file.d ?? "N/A"
                    let path = "/\(dir)/\(file.n ?? "N/A")"
                    let dic = [
                        "time": time,
                        "path": path
                    ]
                    let photoModel = PhotoModel(dictionary: dic)
                    photoList.append(photoModel)
                })
            }
            bindablePhotoList.value = photoList
        }
    }
    
    var bindablePhotoList = Bindable<[PhotoModel]>()
    
    func checkCameraConnection(completion: @escaping (Data?, [String: Any]?, AFError?) -> Void) {
        ws.request(url: "http://192.168.0.1/_gr/objs", method: .post, params: params) { (data, json, err) in
            completion(data, json, err)
        }
    }
    
}
