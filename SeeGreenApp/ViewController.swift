//
//  ViewController.swift
//  SeeGreenApp
//
//  Created by student on 10/21/21.
//
// hiii

import UIKit
import RealityKit
import ARKit
import Combine

class ViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet var arView: ARView!
    
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        arView.session.run(configuration)
        
    
        
    }
    
    @IBAction func placeRobot(_ sender: Any) {
        self.cancellable = ModelEntity.loadModelAsync(named: "toy_robot_vintage.usdz")
            .sink(receiveCompletion: { loadCompletion in
                print("Error unable to load modelEntity")
            }, receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("Debug: Successfulyl oaded model")
            })
        let anchorEntity = AnchorEntity(plane: .any)
        anchorEntity.addChild(modelEntity!)
        
        arView.scene.addAnchor(anchorEntity)
    }
    

}

