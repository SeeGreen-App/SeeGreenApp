//
//  RoundLabel.swift
//  SeeGreenApp
//
//  Created by student on 11/12/21.
//

import UIKit

class RoundLabel: UILabel {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
   override func draw(_ rect: CGRect) {
        // Drawing code
        //Use round label instead of user attribute to keep it dynamic, use for backgrounds, buttons, etc.
       super.draw(rect)
       self.layer.masksToBounds = true
       self.layer.cornerRadius = self.bounds.height/2
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = UIFont(name: "Gaegu-Regular", size: self.font.pointSize)
        self.textColor = UIColor.white

    }
    
}

