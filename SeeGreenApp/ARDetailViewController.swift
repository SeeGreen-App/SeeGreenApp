//
//  ARDetailViewController.swift
//  SeeGreenApp
//
//  Created by student on 12/12/21.
//

import UIKit
import RealityKit

class ARDetailViewController: UIViewController {
    
    @IBOutlet var plantName: UILabel!
    @IBOutlet var plantImage: UIImageView!
    @IBOutlet var careTipsLabel: UILabel!
    @IBOutlet var wateringFrequencyLabel: UILabel!
    @IBOutlet var resolveLabel: UILabel!
    
    
    var passPlantName:String = ""
    var passPlantImage:UIImage = UIImage()
    var passCareTipsLabel:String = ""
    var passWateringFrequencyLabel:String = ""
    var passResolveLabel:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        plantName.text = passPlantName
        plantImage.image = passPlantImage
        careTipsLabel.text = passCareTipsLabel
        wateringFrequencyLabel.text = passWateringFrequencyLabel
        resolveLabel.text = passResolveLabel
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let name : String = passPlantName
        let destinationVC = segue.destination as! ARSceneViewController
        destinationVC.arName = name
    }
    
    
    @IBAction func plantAdd(_ sender: Any) {
        let name : String = passPlantName
        print("plantADD")
        var nameOfPlant = "Unnamed"
        switch name {
        case "Monstera":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: "Monstera", typeName: "Monstera", nickName: nameOfPlant, wateringFrequency: 1, waterLevelPass: 200))
                    LocalStorage.saveToFile(plantsList: plantsContainer)
                    //print(plantsContainer)
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        case "Basil":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: "Fern", typeName: "Basil", nickName: nameOfPlant, wateringFrequency: 3, waterLevelPass: 60))
                    LocalStorage.saveToFile(plantsList: plantsContainer)
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        case "Fern":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: "Fern", typeName: "Fern", nickName: nameOfPlant, wateringFrequency: 2, waterLevelPass: 100))
                    LocalStorage.saveToFile(plantsList: plantsContainer)
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        case "Orchid":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: "Orchid", typeName: "Orchid", nickName: nameOfPlant, wateringFrequency: 5, waterLevelPass: 80))
                    LocalStorage.saveToFile(plantsList: plantsContainer)
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        case "Jade":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: "Jade", typeName: "Jade", nickName: nameOfPlant, wateringFrequency: 1, waterLevelPass: 100))
                    LocalStorage.saveToFile(plantsList: plantsContainer)
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        default:
            print("error")
            
        }
    }
    
    @IBAction func plantAR(_ sender: Any) {
        print("button press")
        
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

/*
 
  
 */
