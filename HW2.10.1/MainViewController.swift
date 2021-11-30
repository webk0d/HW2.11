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
    
    private var spinnerView: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomHouseButtonPressed(_ sender: UIButton) {
        spinnerView = showSpinner(in: view)
        spinnerView?.startAnimating()
        NetworkManager.shared.fetchHouse { result in
            switch result {
            case .success(let house):
                self.spinnerView?.stopAnimating()
                self.houseNameLabel.text = house.name
                self.houseRegionLabel.text = "Region: \(house.region)"
                self.houseCoatOfArmsLabel.text = "Coat of Arms: \(house.coatOfArms)"
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        return activityIndicator
    }
    
}

