//
//  HomeViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit

var currentDayInt:Int = -1

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet var tableViewHome: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewHome.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        
        if let decodedPlantsArr = LocalStorage.loadFromFile() {
            plantsContainer = decodedPlantsArr
        }
        
        let date = Date()
        let calender = Calendar.current
        let day = calender.component(.day, from: date)

        currentDayInt = Int(day);
        print(currentDayInt)
        
        let previousDate = LocalStorage.loadDateFromFile()
        if (previousDate == -1) {
            print(previousDate)
            LocalStorage.saveDate(date: currentDayInt)
        } else {
            let decrimentAmnt:Int = (currentDayInt - previousDate) * 10
            for plant in plantsContainer {
                plant.waterLevel -= decrimentAmnt
            }
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        LocalStorage.saveDate(date: currentDayInt)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsContainer.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: "cellTest") as! WateringTableViewCell
        
        let plantsInfo = plantsContainer[indexPath.row]
        cell.configureCell(with: plantsInfo)
        //cell?.textLabel!.text = plantsContainer[indexPath.row].myName
//        var textWater = String(plantsContainer[indexPath.row].waterLevel)
//         cell?.detailTextLabel!.text = textWater
        
        return cell
    }
    
    


}
