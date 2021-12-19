//
//  WateringViewController.swift
//  SeeGreenApp
//
//  Created by student on 12/2/21.
//

import UIKit

var elapsedTime:Int = 0

class WateringViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var wateringTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        wateringTableView.delegate = self
        wateringTableView.dataSource = self
      
        
        if let decodedPlantsArr = LocalStorage.loadFromFile() {
            plantsContainer = decodedPlantsArr
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        wateringTableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = wateringTableView.dequeueReusableCell(withIdentifier: "plantCareCell") as! plantCareTableViewCell
        
        if (!plantsContainer.isEmpty) {
            let plantsInfo = plantsContainer[indexPath.row]
            cell.configureCell(with: plantsInfo)
            
            if (plantsInfo.waterLevel < (plantsInfo.maxWaterLevel / 2)) {
                cell.backgroundColor = #colorLiteral(red: 0.9146357775, green: 0.1121772602, blue: 0.04847558588, alpha: 0.6011013006)
            }
            if (plantsInfo.waterLevel > (plantsInfo.maxWaterLevel / 2) && plantsInfo.waterLevel < plantsInfo.maxWaterLevel - (plantsInfo.maxWaterLevel / 4)) {
                cell.backgroundColor = #colorLiteral(red: 0.9315149188, green: 0.927011013, blue: 0.03653066233, alpha: 0.5992550881)
            }
            if (plantsInfo.waterLevel > plantsInfo.maxWaterLevel - (plantsInfo.maxWaterLevel / 4) ) {
                cell.backgroundColor = #colorLiteral(red: 0.07854827493, green: 0.8050493598, blue: 0.07919494063, alpha: 0.6003670598)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        if (plantsContainer[indexPath.row].waterLevel < (plantsContainer[indexPath.row].maxWaterLevel - 9) && plantsContainer[indexPath.row].waterLevel != 0 ) {
            plantsContainer[indexPath.row].waterLevel += 10
            plantsContainer[indexPath.row].growthProgress += 0.01
            LocalStorage.saveToFile(plantsList: plantsContainer)
            tableView.reloadRows(at: [indexPath], with: .bottom)
        }
    }
    
}
