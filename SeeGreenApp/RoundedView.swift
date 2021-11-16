//
//  RoundedView.swift
//  SeeGreenApp
//
//  Created by student on 11/12/21.
//

import UIKit

class RoundedView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.height/2
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0.00, green: 0.56, blue: 0.32, alpha: 1.00)
    }
}
