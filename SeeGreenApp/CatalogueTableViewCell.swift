//
//  CatalogueTableViewCell.swift
//  SeeGreenApp
//
//  Created by student on 11/11/21.
//

import UIKit

protocol CatalogueTableViewCellDelegate {
    func didTapButton(with title: String)
}


class CatalogueTableViewCell: UITableViewCell {
    
    var delegate: CatalogueTableViewCellDelegate?
    
    @IBOutlet var plantPictureTableView: UIImageView!
    
    @IBOutlet var plantName: UILabel!
    @IBOutlet var plantDescription: UILabel!
    
    @IBAction func buttonAR(_ sender: Any) {
        delegate?.didTapButton(with: plantName.text!)
    }
    
    static let identifier = "CatalogueTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CatalogueTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


