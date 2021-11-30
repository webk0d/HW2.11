//
//  NetworkManager.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 28.11.2021.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}

    func fetchHouse(with completion: @escaping(Result<House, NetworkError>) -> Void) {
        guard let url = URL(string: "https://www.anapioficeandfire.com/api/houses/\(Int.random(in: 0...9))") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No description error")
                return
            }
            do {
                let house = try
                JSONDecoder().decode(House.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(house))
                }
            } catch let error {
                completion(.failure(.decodingError))
                print(error)
            }
            
        }.resume()
    }
}
