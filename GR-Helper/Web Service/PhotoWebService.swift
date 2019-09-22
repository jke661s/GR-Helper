//
//  PhotoWebService.swift
//  GR-Helper
//
//  Created by Jackie Wang on 21/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

enum ImageSize: String {
    case thumb = "thumb"
    case view = "view"
    case full = "full"
}

class PhotoWebService {
    private let ws = WebService.shared
    static let shared = PhotoWebService()
    
    func getImage(url: String, size: ImageSize, completion: ((Data?) -> Void)?) {
        ws.request(url: url, method: .get, params: ["size": size.rawValue]) { (data, _, err) in
            if let err = err {
                print(err)
                return
            }
            guard let completion = completion else { return }
            completion(data)
        }
    }
}
