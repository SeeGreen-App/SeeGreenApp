//
//  plant.swift
//  SeeGreenApp
//
//  Created by student on 10/31/21.
//

import Foundation
import UIKit

class Plants {
    init (imageSet:UIImage, typeName:String) {
        image = imageSet
        name = typeName
    }
    var image:UIImage!
    var waterLevel = 100;
    var sunLevel = 100;
    var name = "none"
    
    func decrimentWater () {
        waterLevel = waterLevel - 10;
    }
    func decrimentSum() {
        sunLevel = sunLevel - 10;
    }
    
    func refillWater() {
        waterLevel = waterLevel + 10;
    }
    
    func refillSun() {
        sunLevel = sunLevel + 10;
    }
    
}

var plantsContainer = [Plants]();
