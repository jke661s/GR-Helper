//
//  WebService.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation
import Alamofire

class WebService {
    
    static let shared = WebService()
    // Configuration
    private var manager: Session!
    private let timeoutInterval: TimeInterval = 5
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        manager = Session(configuration: configuration)
    }
    
    func request(url: String, method:HTTPMethod, params: Parameters, completion: @escaping (Data?, [String: Any]?, AFError?) -> Void) {
        guard let manager = manager else {
            print("Session does not exist.")
            return
        }
        print("heihei")
        manager.request(url, method: method, parameters: params).response { (response) in
            print("here i am")
            print("Status code: ",response.response?.statusCode)

            switch response.result {
            case .success(let data):
                guard let data = data else {
                    print("No data received")
                    return
                }
                print(String(data: data, encoding: .utf8))
//                print(data.base64EncodedString())
                let jsonData = try? JSONSerialization.jsonObject(with:
                    data, options: [])
                guard let result = jsonData as? [String: Any] else {
                    print("JSONSerialization failed.")
                    completion(data, nil, nil)
                    return
                }
                completion(nil, result, nil)
            case .failure(let err):
                completion(nil, nil, err)
            }
        }
        
        
//        manager.request(url, method: method, parameters: params).validate(statusCode: 200..<300).response { (response) in
//            switch response.result {
//            case .success(let data):
//                let jsonResponse = try JSONSerialization.jsonObject(with:
//                    data, options: [])
//                completion(jsonResponse, nil)
//            case .failure(let err):
//                print("Err")
////                completion(nil, err)
//            }
//        }
    }
    
}
