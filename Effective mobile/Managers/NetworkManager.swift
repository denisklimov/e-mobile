//
//  NetworkManager.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import Foundation
import UIKit

enum NetworkManagerError: Error {
    case invalidUrl
    case unknownError
    case dataToImageFail
}

extension NetworkManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
            case .invalidUrl:
                return "Invalid URL"
            case .unknownError:
                return "Unkown error in guard Data block"
        case .dataToImageFail:
            return "Can't create image from data"
        }
    }
}

class NetworkManager {
    
    func getData(from urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkManagerError.invalidUrl))
            return
        }
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkManagerError.unknownError))
                return
            }
            completion(.success(data))
        }.resume()
    }
    
    func getImageFrom(url urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        getData(from: urlString) { result in
            switch result {
                case .success(let imageData):
                    guard let image = UIImage(data: imageData) else {
                        completion(.failure(NetworkManagerError.dataToImageFail))
                        return
                    }
                    completion(.success(image))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }

}
