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
        
        var nameOfPlant = "Unnamed"
        
        switch name {
        
        case "monsterra":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Monsterra", nickName: nameOfPlant, wateringFrequency: 10))
                }
                messsage.addAction(add)

            }
            self.present(messsage, animated: true, completion: nil)
            
        case "basil":
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
            
        case "fern":
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
            
        case "orchid":
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
            
        case "succulent":
            let messsage = UIAlertController(title: "", message: "What would you like to name your new plant?", preferredStyle: .alert)
            messsage.addTextField { UITextField in
                UITextField.placeholder = "Type name here"
                
                let add = UIAlertAction(title: "OK", style: .default) { alert in
                    nameOfPlant = (messsage.textFields?.first!.text)!
                    plantsContainer.append(Plants(imageSet: UIImage(systemName: "pencil")!, typeName: "Succulent", nickName: nameOfPlant, wateringFrequency: 10))
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
