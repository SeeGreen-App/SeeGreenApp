//
//  WateringTableViewCell.swift
//  SeeGreenApp
//
//  Created by student on 12/2/21.
//

import UIKit

class WateringTableViewCell: UITableViewCell {
    
    @IBOutlet var plantName: UILabel!
    @IBOutlet var plantImage: UIImageView!
    
    @IBOutlet var plantType: UILabel!
    
    @IBOutlet var growthLabel: UILabel!
    @IBOutlet var plantGrowthLevel: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(with plant: Plants) {
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
        
        
        plantName.text = plant.myName
        plantType.text = plant.name
        //waterLevel.text = String(plant.waterLevel)
        plantGrowthLevel.progress = plant.growthProgress
        if (plant.growthProgress >= 1.0) {
            self.backgroundColor = #colorLiteral(red: 0.907879293, green: 0.8135741353, blue: 0.04839689285, alpha: 1)
            growthLabel.text = "Full adult!"
        } else {
            self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        if (plant.growthProgress < 1.0 && plant.growthProgress > 0.5 ) {
            growthLabel.text = "Almost there!"
        } else if (plant.growthProgress < 0.5) {
            growthLabel.text = "Seedling!"
        }
        if (plant.waterLevel == 0) {
            growthLabel.text = "Oh no!"
        }
    }
    
}
