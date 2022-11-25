//
//  Helper.swift
//  NasaGallery
//
//  Created by Sowrirajan S on 21/11/22.
//

import Foundation
import UIKit

class ServiceWorker: NSObject {

    class func fetch<T: Codable>(url: URL, closureHandler: @escaping(T) -> Void) {
                
        URLSession.shared.dataTask(with: url) { (responseData, _, error) in
            
            
            guard error == nil else { return }
            
            guard let response = responseData else { return }
            
            do {
                let data = try JSONDecoder.init().decode(T.self, from: response)
                closureHandler(data)
            } catch {
                print("Error found :: refer Service Worker")
            }
        }.resume()
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, imageView: UIImageView) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
