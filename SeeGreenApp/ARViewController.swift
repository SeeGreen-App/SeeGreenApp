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
        plantsDescription(setName: "Monstera", setDescrip: "Aka the swiss cheese plant.", setImg: UIImage(systemName: "pencil")!),
        
        plantsDescription(setName: "Basil", setDescrip: "Not just a garnish!", setImg: UIImage(systemName: "pencil")!),
        
        plantsDescription(setName: "Fern", setDescrip: "No tanning sessions for this plant!", setImg: UIImage(systemName: "pencil")!),
        
        plantsDescription(setName: "Orchid", setDescrip: "Also a symbol for love...", setImg: UIImage(systemName: "pencil")!),
        
        plantsDescription(setName: "Jade", setDescrip: "Like a mini-tree!", setImg: UIImage(systemName: "pencil")!)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: CatalogueTableViewCell.identifier) as! CatalogueTableViewCell
        cell.plantName.text! = plantsArr[indexPath.row].name
        cell.plantDescription.text! = plantsArr[indexPath.row].description
        cell.plantPictureTableView.image = plantsArr[indexPath.row].plantIcon
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!)! as! CatalogueTableViewCell
        
        let name:String = currentCell.plantName.text!
        
        var nameOfPlant = "Unnamed"
        switch name {
        
        case "Monstera":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Monstera", nickName: nameOfPlant, wateringFrequency: 10))
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
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Basil", nickName: nameOfPlant, wateringFrequency: 10))
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
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Fern", nickName: nameOfPlant, wateringFrequency: 10))
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
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Orchid", nickName: nameOfPlant, wateringFrequency: 10))
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
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Jade", nickName: nameOfPlant, wateringFrequency: 10))
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        default:
            print("error")
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let currentTable = tableView.indexPathForSelectedRow
        
        let vc = TestViewController()
        navigationController?.pushViewController(vc, animated: true)
        return nil
    }

}


extension ARViewController: CatalogueTableViewCellDelegate {
    
    
    func didTapButton(with title: String) {
        print("\(title)")
        arTitle = title
    }
}
