//
//  String.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/5/21.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func getData(completion: @escaping (Result<[Any], Error>) -> Void) {
        guard let url = URL(string: self) else {
            print("Invalid url!")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)
                print(jsonObject)
                if let dictionary = jsonObject as? [Any] {
                    completion(.success(dictionary))
                    return
                } else {
                    completion(.success([jsonObject]))
                }
                
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}
