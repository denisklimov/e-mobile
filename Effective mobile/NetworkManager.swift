//
//  NetworkManager.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import Foundation
import UIKit

class NetworkManager {
    
    private let session = URLSession.shared
    
    //func getData(from urlString: String, handler: @escaping (Data?) -> Void, failure: @escaping (String?) -> Void) {
    
    func getData(from urlString: String, handler: @escaping (Data?) -> Void) {
        // var err: String?
        guard let url = URL(string: urlString) else { print("ERR"); return }
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
            if let data = data {
                handler(data)
            }
        }.resume()
    }
    
    func getImageFrom(url urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        getData(from: urlString) { imageData in
            guard let imageData = imageData else { return }
            let image = UIImage(data: imageData)
            completion(image)
        }
    }

}
