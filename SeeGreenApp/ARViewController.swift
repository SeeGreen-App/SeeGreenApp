//
//  ARViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit

class ARViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMonstera(_ sender: Any) {
        plantsContainer.append(Plants(imageSet: UIImage(systemName: "multiply.circle.fill")!, typeName: "monstera"))
            print("monsterra applied")
        print(plantsContainer[plantsContainer.count - 1].name)
    }
    
    @IBAction func addJadeSucculent(_ sender: Any) {
        plantsContainer.append(Plants(imageSet: UIImage(systemName: "multiply.circle.fill")!, typeName: "succulent"))
    }
    @IBAction func addFern(_ sender: Any) {
        plantsContainer.append(Plants(imageSet: UIImage(systemName: "multiply.circle.fill")!, typeName: "fern"))
    }
    
    @IBAction func addBasil(_ sender: Any) {
        plantsContainer.append(Plants(imageSet: UIImage(systemName: "multiply.circle.fill")!, typeName: "basil"))
    }
    
    @IBAction func addOrchid(_ sender: Any) {
        plantsContainer.append(Plants(imageSet: UIImage(systemName: "multiply.circle.fill")!, typeName: "orchid"))
    }
    
    
}
