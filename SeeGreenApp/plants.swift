//
//  plants.swift
//  SeeGreenApp
//
//  Created by student on 11/9/21.
//

import Foundation
import UIKit

class Plants: Codable {
    init (imageSet:String, typeName:String, nickName:String, wateringFrequency: Int, waterLevelPass: Int) {
        image = imageSet
        name = typeName
        myName = nickName
        wateringNeed = wateringFrequency
        waterLevel = waterLevelPass
        maxWaterLevel = waterLevelPass
    }
    var maxWaterLevel:Int = 20
    var image:String = "nil"
    var waterLevel = 100;
    var name = "none"
    var myName = "none"
    var wateringNeed = 1;
    
    func decrimentWater () {
        waterLevel = waterLevel - wateringNeed;
    }

    
    func refillWater() {
        waterLevel = waterLevel + wateringNeed;
    }
    
    
}

var plantsContainer = [Plants]();

class plantsDescription {
    init (setName:String, setDescrip:String, setImg:UIImage, setCareTips:String = "care test", setWateringFreqText:String = "wateringFreq", setResolveText:String = "resolveText") {
        name = setName
        description = setDescrip
        plantIcon = setImg
        careTips = setCareTips
        wateringFreq = setWateringFreqText
        resolveText = setResolveText
    }
    var name:String = "none"
    var description:String = "none"
    var plantIcon:UIImage = UIImage(systemName: "pencil")!
    var careTips:String!
    var wateringFreq:String!
    var resolveText:String!
}
