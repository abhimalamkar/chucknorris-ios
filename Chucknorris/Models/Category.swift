//
//  Category.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//

import Foundation

struct Category: Codable, Hashable {
    var title:String
    
    init(title:String) {
        self.title = title
    }
    
    static func builder(_ data:[Any]) -> [Category] {
        print(data)
        if let list = data as? [String] {
            return list.map { Category(title: $0) }
        }
        
        return []
    }
}
