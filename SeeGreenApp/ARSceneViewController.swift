//
//  ARSceneViewController.swift
//  SeeGreenApp
//
//  Created by student on 12/18/21.
//
import Foundation
import UIKit
import RealityKit
import QuickLook


class ARSceneViewController: UIViewController{

    
    
    @IBOutlet var arView: ARView!
    var arName: String = ""

 //   let monsteraAnchor = try? Entity.loadAnchor(named: "monstera")
 //   let basilAnchor = try? Entity.loadAnchor(named: "basil")
 //   let orchidAnchor = try? Entity.loadAnchor(named: "orchid")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name : String = arName
        print(name)


        switch name {
            case "Monstera":
            print("ar scene")
               //let url = URL(fileURLWithPath: "./monstera.reality")
              // let entity = try? Entity.load(contentsOf: url)
            

            
        //case "Basil":
        //  let url = URL(fileURLWithPath: "./basil.reality")
         //  _ = try? Entity.load(contentsOf: url, withName: "basil")

           // arView.scene.anchors.append(basilAnchor)
//            case "Orchid":
//            let url = URL(fileURLWithPath: "./orchid.reality")
//            _ = try? Entity.load(contentsOf: url, withName: "orchid")

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
