//
//  CollectionViewModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation
import Alamofire
import SystemConfiguration.CaptiveNetwork

let semaphore = DispatchSemaphore(value: 0)

class CollectionViewModel {
    
    private let ws = WebService.shared
    var objectModel: ObjectModel! {
        didSet {
            var photoList = [PhotoModel]()
            objectModel.dirs.forEach { (dir) in
                dir.files.forEach({ (file) in
                    let time = file.d ?? "N/A"
                    let path = "/\(dir.name ?? "N/A")/\(file.n ?? "N/A")"
                    let dic = [
                        "time": time,
                        "path": path
                    ]
                    let photoModel = PhotoModel(dictionary: dic)
                    photoList.append(photoModel)
                })
            }
            let groupDictionary = Dictionary(grouping: photoList, by: { return $0.time })
            groupDictionary.keys.forEach { (key) in
                groupedPhotoList.append(groupDictionary[key] ?? [PhotoModel]())
            }
        }
    }
    var bindableIsRicohWifiConnected = Bindable<Bool>()
    var groupedPhotoList = [[PhotoModel]]()
    
    

    
    init() {
//        self.checkCameraConnection()
//        bindableIsRicohWifiConnected.value = checkCameraConnection()
        test()

    }
    
    func test() {
        var manager: Session!
        let timeoutInterval: TimeInterval = 5
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        manager = Session(configuration: configuration)
        print("heihei")
        
        manager.request("http://192.168.0.1/v1/ping", method: .get, parameters: [:]).response { (response) in
            print("here i am")
            print("Status code: ",response.response?.statusCode)
            
            switch response.result {
            case .success(let data):
                guard let data = data else {
                    print("No data received")
                    return
                }
                print(String(data: data, encoding: .utf8))

                let jsonData = try? JSONSerialization.jsonObject(with:
                    data, options: [])
                guard let result = jsonData as? [String: Any] else {
                    print("JSONSerialization failed.")
                    return
                }
                self.bindableIsRicohWifiConnected.value = true
            case .failure(let err):
                self.bindableIsRicohWifiConnected.value = false
                return
            }
            
            semaphore.signal()
        }
        
        semaphore.wait()
        
    }
    
    
    
    
    func checkConnectionAsyncAwait() -> Bool? {
        var isConnecetd: Bool?
        ws.request(url: "http://192.168.0.1/v1/ping", method: .get, params: [:]) { [weak self] (_, json, _) in
            guard let self = self else { return }
            isConnecetd = !(json == nil)
            semaphore.signal()
            print(self.bindableIsRicohWifiConnected.value)
        }
        semaphore.wait()
        return isConnecetd
    }
    
    func checkCameraConnection() -> Bool? {
        var isConnected: Bool?
        
        guard let url = URL(string: "http://192.168.0.1/v1/ping") else { return false }
        URLSession.shared.dataTask(with: url) { (d, r, e) in
            print("xixi")
            if let data = d {
                isConnected = true
            }
            semaphore.signal()
        }.resume()
        print("wait")
        semaphore.wait()
        return isConnected
    }
    
    func getPhotoList(completion: @escaping (Data?, [String: Any]?, AFError?) -> Void) {
        let params = [String: Any]()
        ws.request(url: "http://192.168.0.1/_gr/objs", method: .get, params: params) { (data, json, err) in
            completion(data, json, err)
        }
    }
    
    // MARK: - fileprivate functions
    fileprivate func getWiFiSsid() -> String? {
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
