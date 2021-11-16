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
    let notificationPublisher  = NotificationPublisher()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
//    @IBAction func notificationBtn(_ sender: Any) {
//        notificationPublisher.sendNotifications(title: "say hello", subtitle: "from Fay", body: "hello", badge: 1, delayInterval: 10)
//    }
    @IBAction func viewAllButton(_ sender: Any) {
    }
    


}

