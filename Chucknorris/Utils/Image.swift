//
//  Image.swift
//  Chucknorris
//
//  Created by Abhijeet Malamkar on 5/6/21.
//

import UIKit

extension UIImageView {
    static let imageCache = NSCache<NSString, AnyObject>()

    func downloadImageFrom(urlString: String, imageMode: UIView.ContentMode) {
        guard let url = URL(string: urlString) else { return }
        downloadImageFrom(url: url, imageMode: imageMode)
    }

    func downloadImageFrom(url: URL, imageMode: UIView.ContentMode) {
        contentMode = imageMode
        if let cachedImage = UIImageView.imageCache.object(forKey: url.absoluteString as NSString) as? UIImage {
                self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data)
                    UIImageView.imageCache.setObject(imageToCache!, forKey: url.absoluteString as NSString)
                    self.image = imageToCache
                }
            }.resume()
        }
    }
}
