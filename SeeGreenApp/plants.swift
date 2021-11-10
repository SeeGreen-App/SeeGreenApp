//
//  plants.swift
//  SeeGreenApp
//
//  Created by student on 11/9/21.
//

import Foundation
import UIKit

class Plants {
    init (imageSet:UIImage, typeName:String, nickName:String, wateringFrequency: Int) {
        image = imageSet
        name = typeName
        myName = nickName
        wateringNeed = wateringFrequency
        
    }
    var image:UIImage!
    var waterLevel = 100;
    var name = "none"
    var myName = "none"
    var wateringNeed = 1;
    
    func decrimentWater () {
        waterLevel = waterLevel - wateringNeed;
    }

    
    func refillWater() {
        waterLevel = waterLevel + 10;
    }
    
    
}

var plantsContainer = [Plants]();
