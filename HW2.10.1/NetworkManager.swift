//
//  NetworkManager.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 28.11.2021.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchHouse(with completion: @escaping(Result<House, NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses/\(Int.random(in: 1...9))") else {
            completion(.failure(.invalidURL))
            return
        }
        
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let houseData = value as? [String: Any] else {
                        completion(.failure(.decodingError))
                        return
                    }
                    
                    let house = House(houseData: houseData)
                    completion(.success(house))
                case .failure:
                    completion(.failure(.decodingError))
                }
            }
        
        
    }
}
