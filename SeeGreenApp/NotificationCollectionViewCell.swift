//
//  NotificationCollectionViewCell.swift
//  SeeGreenApp
//
//  Created by student on 12/12/21.
//

import UIKit

class NotificationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var plantImage: UIImageView!
    @IBOutlet var plantName: UILabel!
    
    
    func configureCollectionCell(with plant: Plants) {
        print("configure cell")
        switch plant.name {
            case "Monstera":
                plantImage.image = UIImage(named: "fern")
            case "Basil":
                plantImage.image = UIImage(named: "basil")
            case "Fern":
                plantImage.image = UIImage(named: "fern")
            case "Orchid":
                plantImage.image = UIImage(named: "orchid")
            case "Jade":
                plantImage.image = UIImage(named: "succulent")
            default:
                plantImage.image = UIImage(named: "basil")
        }
        let waterNeed = (plant.maxWaterLevel - plant.waterLevel) / 10
        
        plantName.text = "\(plant.myName) needs \(waterNeed) water"
        if (plant.waterLevel <= 0) {
            plantName.text = "\(plant.myName) has died!"
        }
    }
}
