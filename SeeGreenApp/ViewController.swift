//
//  ViewController.swift
//  SeeGreenApp
//
//  Created by student on 10/21/21.
//
// hiii
// added ara branch :) and added this comment in that branch

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    @IBAction func viewAllButton(_ sender: Any) {
    }
    


}

