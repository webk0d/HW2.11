//
//  House.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 27.11.2021.
//

struct House : Decodable {

    let name: String?
    let region: String?
    let coatOfArms: String?
    
    init(houseData: [String: Any]) {
        name = houseData["name"] as? String
        region = houseData["region"] as? String
        coatOfArms = houseData["coatOfArms"] as? String
    }
    
}
