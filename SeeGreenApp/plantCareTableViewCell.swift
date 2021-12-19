//
//  plantCareTableViewCell.swift
//  SeeGreenApp
//
//  Created by student on 12/12/21.
//

import UIKit


class plantCareTableViewCell: UITableViewCell {
    @IBOutlet var plantName: UILabel!
    @IBOutlet var waterLevel: UILabel!
    @IBOutlet var plantImage: UIImageView!
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

        waterLevel.text = String(plant.waterLevel)
    }

}
