//
//  Model.swift
//  SeeGreenApp
//
//  Created by student on 10/24/21.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: { loadCompletion in
                print("Error unable to load modelEntity")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("Debug: Successfulyl oaded model")
            })
        
    }
}
