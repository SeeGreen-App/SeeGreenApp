//
//  ARSceneViewController.swift
//  SeeGreenApp
//
//  Created by student on 12/18/21.
//
import Foundation
import UIKit
import RealityKit

class ARSceneViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var plantName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let name : String = plantName
        
        switch name {
            case "Monstera":
            let url = URL(fileURLWithPath: "./monstera.reality")
            _ = try? Entity.load(contentsOf: url, withName: "monstera")
             //   let monsteraAnchor = try? Entity.loadAnchor(named: "monstera")
           // arView.scene.anchors.append(contentsOf: monsteraAnchor)
            case "Basil":
            let url = URL(fileURLWithPath: "./basil.reality")
            _ = try? Entity.load(contentsOf: url, withName: "basil")
            //    let basilAnchor = try? Entity.loadAnchor(named: "basil")
           // arView.scene.anchors.append(basilAnchor)
            case "Orchid":
            let url = URL(fileURLWithPath: "./orchid.reality")
            _ = try? Entity.load(contentsOf: url, withName: "orchid")
            //   let orchidAnchor = try? Entity.loadAnchor(named: "orchid")
            //arView.scene.anchors.append(orchidAnchor)
        default:
            print("error")

        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
