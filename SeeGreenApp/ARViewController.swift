//
//  ARViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit


class ARViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arTitle:String = ""
    
    var plantsArr = [
        plantsDescription(setName: "Monstera", setDescrip: "Aka the swiss cheese plant.", setImg: UIImage(systemName: "pencil")!, setCareTips: "Easiest to take care off, great starter plant", setWateringFreqText: "Infrequent", setResolveText: "Hardy plant, won't need to water often"),
        
        plantsDescription(setName: "Basil", setDescrip: "Not just a garnish!", setImg: UIImage(systemName: "pencil")!, setCareTips: "fickle, can't store much water", setWateringFreqText: "freqeunt", setResolveText: "Can moderately withstand dry periods"),
        
        plantsDescription(setName: "Fern", setDescrip: "No tanning sessions for this plant!", setImg: UIImage(systemName: "pencil")!, setCareTips: "It's almost as easy as the Monstera!", setWateringFreqText: "Semi-frequent", setResolveText: "moderately resistant"),
        
        plantsDescription(setName: "Orchid", setDescrip: "Also a symbol for love...", setImg: UIImage(systemName: "pencil")!, setCareTips: "Needs a lot of water and direct sunlight!", setWateringFreqText: "Water this one frequently", setResolveText: "Although resistant, need to water frequently"),
        
        plantsDescription(setName: "Jade", setDescrip: "Like a mini-tree!", setImg: UIImage(systemName: "pencil")!, setCareTips: "Water this one infrequently! Hardy plant but not alot of health", setWateringFreqText: "infrequent", setResolveText: "High resolve")
    ]
    @IBOutlet var tableView: UITableView!
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CatalogueTableViewCell.nib(), forCellReuseIdentifier: "CatalogueTableViewCell")
        self.tableView.rowHeight = 125
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "catalogueCell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel!.text = plantsArr[indexPath.row].name
        cell.detailTextLabel?.text = plantsArr[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as!  ARDetailViewController
        destinationVC.passPlantName = plantsArr[tableView.indexPathForSelectedRow!.row].name
        destinationVC.passPlantImage = plantsArr[tableView.indexPathForSelectedRow!.row].plantIcon
        destinationVC.passCareTipsLabel = plantsArr[tableView.indexPathForSelectedRow!.row].careTips
        destinationVC.passWateringFrequencyLabel = plantsArr[tableView.indexPathForSelectedRow!.row].wateringFreq
        destinationVC.passResolveLabel = plantsArr[tableView.indexPathForSelectedRow!.row].resolveText
   
    }
    


}



