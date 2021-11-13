//
//  HomeViewController.swift
//  SeeGreenApp
//
//  Created by Alla Baker on 10/25/21.
//

import UIKit

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
        // Do any additional setup after loading the view.
//
//            for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plantsContainer.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewHome.dequeueReusableCell(withIdentifier: "cellTest")
        cell?.textLabel!.text = plantsContainer[indexPath.row].myName
        
        return cell!
    }
    
    


}
