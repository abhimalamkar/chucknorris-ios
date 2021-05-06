//
//  Fact.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//
import Foundation

struct Fact: Codable, Hashable {
    var created_at:String
    var icon_url:String
    var url:String
    var value:String
    
    init(_ data: [String:Any]) {
        self.created_at = (data["created_at"] as? String) ?? ""
        self.icon_url = (data["icon_url"] as? String) ?? ""
        self.url = (data["url"] as? String) ?? ""
        self.value = (data["value"] as? String) ?? ""
    }
}

