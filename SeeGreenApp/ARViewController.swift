//
//  ARViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit

class ARViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var plantsArr = ["monsterra", "basil", "fern", "orchid", "succulent"]
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.textLabel!.text = plantsArr[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        let name:String = currentCell.textLabel!.text!
        
        switch name {
        case "monsterra":
            print("appending monsterra")
            plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Monsterra", nickName: "", wateringFrequency: 10))
            print(plantsContainer[indexPath!.row].name)
        case "basil":
            print("appending monsterra")
            plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Basil", nickName: "", wateringFrequency: 10))
        case "fern":
            print("appending monsterra")
            plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Fern", nickName: "", wateringFrequency: 10))
        case "orchid":
            print("appending monsterra")
            plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Orchid", nickName: "", wateringFrequency: 10))
        case "succulent":
            print("appending monsterra")
            plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Succulent", nickName: "", wateringFrequency: 10))
        default:
            print("error")
            
        }
        
    }

}
