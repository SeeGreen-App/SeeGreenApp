//
//  HomeViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var notificationPlantArr = [Plants]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        notificationPlantArr.removeAll()
        for plant in plantsContainer {
            if (plant.waterLevel < (plant.maxWaterLevel / 2)) {
                notificationPlantArr.append(plant)
            }
        }
        return notificationPlantArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = notificationCollectionView.dequeueReusableCell(withReuseIdentifier: "wateringCell", for: indexPath) as! NotificationCollectionViewCell
    
        // Configure the cell
        
        cell.configureCollectionCell(with: notificationPlantArr[indexPath.row])
        return cell
    }
    

    @IBOutlet var plantCountLabel: UILabel!
    
    @IBOutlet var tableViewHome: UITableView!
    @IBOutlet var notificationCollectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableViewHome.reloadData()
        notificationCollectionView.reloadData()
        
        if (plantsContainer.count == 1) {
            plantCountLabel.text = "You have \(plantsContainer.count) plant"
        } else {
            plantCountLabel.text = "You have \(plantsContainer.count) plants"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewHome.delegate = self
        tableViewHome.dataSource = self
        notificationCollectionView.dataSource = self
        notificationCollectionView.delegate = self
        notificationCollectionView.setCollectionViewLayout(generateLayout(), animated: true)
        if (plantsContainer.count == 1) {
            plantCountLabel.text = "You have \(plantsContainer.count) plant"
        } else {
            plantCountLabel.text = "You have \(plantsContainer.count) plants"
        }
      
        
        if let decodedPlantsArr = LocalStorage.loadFromFile() {
            plantsContainer = decodedPlantsArr
        }
        
    }
    
    func generateLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 10
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(3.0))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(70))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2 )
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsContainer.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: "cellTest") as! WateringTableViewCell
        
        if (!plantsContainer.isEmpty) {
            let plantsInfo = plantsContainer[indexPath.row]
            cell.configureCell(with: plantsInfo)
            if (plantsContainer[indexPath.row].growthProgress >= 1.0) {
                cell.backgroundColor = #colorLiteral(red: 0.907879293, green: 0.8135741353, blue: 0.04839689285, alpha: 1)
            } else if (plantsContainer[indexPath.row].waterLevel == 0){
                cell.backgroundColor = #colorLiteral(red: 0.9039922357, green: 0.2534269691, blue: 0.05238456279, alpha: 0.8008683565)
            } else {
                cell.backgroundColor = .white
            }
            if (plantsContainer[indexPath.row].waterLevel == 0){
                cell.backgroundColor = #colorLiteral(red: 0.9039922357, green: 0.2534269691, blue: 0.05238456279, alpha: 0.8008683565)
            }
        }
        //cell?.textLabel!.text = plantsContainer[indexPath.row].myName
//        var textWater = String(plantsContainer[indexPath.row].waterLevel)
//         cell?.detailTextLabel!.text = textWater
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            plantsContainer.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            LocalStorage.saveToFile(plantsList: plantsContainer)
        }
    }
    
    


}
