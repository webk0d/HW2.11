//
//  MainViewController.swift
//  HW2.10.1
//
//  Created by Сергей Чумаков on 28.11.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var houseRegionLabel: UILabel!
    @IBOutlet weak var houseCoatOfArmsLabel: UILabel!
    
    private var networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.delegate = self
    }
    
    @IBAction func randomHouseButtonPressed(_ sender: UIButton) {
        networkManager.fetchHouse()
    }
    
}

extension MainViewController: NetworkManagerDelegate {
    func updateInterface(_: NetworkManager, with house: House) {
        DispatchQueue.main.async {
            self.houseNameLabel.text = house.name
            self.houseRegionLabel.text = "Region: \(house.region)"
            self.houseCoatOfArmsLabel.text = "Coat of Arms: \(house.coatOfArms)"
        }
    }
}
