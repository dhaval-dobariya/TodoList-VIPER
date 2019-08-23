//
//  TodoModel.swift
//  TodoList-VIPER
//
//  Created by Dhaval on 22/08/19.
//

import Foundation

class TodoModel: NSObject, NSCoding, Codable {
    
    var title:String?
    
    init(title: String) {
        self.title = title
    }
    
    required init(coder decoder: NSCoder) {
        self.title = decoder.decodeObject(forKey: "title") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
    }
}
