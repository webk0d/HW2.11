//
//  House.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 27.11.2021.
//

struct House : Decodable {

    let name: String
    let region: String
    let coatOfArms: String
    
    init?(house: House) {
        name = house.name
        region = house.region
        coatOfArms = house.coatOfArms
    }
    
}
