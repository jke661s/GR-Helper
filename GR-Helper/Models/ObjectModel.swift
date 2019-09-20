//
//  ObjectModel.swift
//  GR-Helper
//
//  Created by Jackie Wang on 15/9/19.
//  Copyright © 2019 Jackie Wang. All rights reserved.
//

import Foundation

class File {
    var n: String?
    var o: Int?
    var s: String?
    var d: String?
    
    init(dic: [String: Any]) {
        self.n = dic["n"] as? String ?? "N/A"
        self.o = dic["o"] as? Int ?? 0
        self.s = dic["s"] as? String ?? "N/A"
        self.d = dic["d"] as? String ?? "N/A"
    }
}

class Dir {
    var name: String?
    var files: [File] = []
    
    init(dic: [String: Any]) {
        self.name = dic["name"] as? String ?? "N/A"
        let jsonFiles = dic["files"] as? NSArray
        jsonFiles?.forEach({ (file) in
            guard let file = file as? [String: Any] else { return }
            self.files.append(File(dic: file))
        })
    }
}

class ObjectModel {
    var errCode: Int?
    var errMsg: String?
    var dirs: [Dir] = []
    
    init(dic: [String: Any]) {
        self.errCode = dic["errCode"] as? Int ?? 0
        self.errMsg = dic["errMsg"] as? String ?? "N/A"
        let jsonDirs = dic["dirs"] as? NSArray
        jsonDirs?.forEach({ (dir) in
            guard let dir = dir as? [String: Any] else { return }
            self.dirs.append(Dir(dic: dir))
        })
    }
}
