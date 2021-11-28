//
//  NetworkManager.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 28.11.2021.
//

import Foundation

protocol NetworkManagerDelegate {
    func updateInterface(_: NetworkManager, with house: House)
}

class NetworkManager {
    
    var delegate: NetworkManagerDelegate?

    func fetchHouse() {
        let apiUrl = "https://www.anapioficeandfire.com/api/houses/\(Int.random(in: 0...9))"
        guard let url = URL(string: apiUrl) else { return }
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, _ , error in
            if let data = data {
                if let house = self.parseJACON(with: data) {
                    self.delegate?.updateInterface(self, with: house)
                }
            }
        }
        task.resume()
    }
    
    private func parseJACON(with data: Data) -> House? {
        let decoder = JSONDecoder()
        do {
            let houseDecode = try decoder.decode(House.self, from: data)
            guard let house = House(house: houseDecode) else { return nil }
            return house
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
