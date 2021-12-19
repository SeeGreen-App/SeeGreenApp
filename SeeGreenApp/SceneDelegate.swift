//
//  SceneDelegate.swift
//  SeeGreenApp
//
//  Created by student on 10/21/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
        LocalStorage.saveToFile(plantsList: plantsContainer)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("got in here")
        guard let lastOpened = UserDefaults.standard.object(forKey: "LastOpened") as? Date else {
            print("null last date")
            return
        }
        let elapsed = Calendar.current.dateComponents([.second], from: lastOpened, to: Date())
        
        UserDefaults.standard.setValue(Date(), forKey: "LastOpened")
        elapsedTime = elapsed.second!
        print("This is the elapsed hours: \(elapsedTime)")
        for plant in plantsContainer {
            print("elapsed time * wateringNeed = " + String(plant.wateringNeed))
                plant.waterLevel -= (elapsedTime * plant.wateringNeed)
                if (plant.waterLevel < 0) {
                    plant.waterLevel = 0
                }
            
        }
        LocalStorage.saveToFile(plantsList: plantsContainer)
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert]) { granted, error in
            if (granted == false) {
                print("no notifications will be recieved")
                return
            }
            if let NewError = error {
                print("Notification error is: " + NewError.localizedDescription)
            }
        
        for plant in plantsContainer {
            if (plant.waterLevel - (24 * plant.wateringNeed) < (plant.maxWaterLevel / 4)) {
                let content = UNMutableNotificationContent()
                content.title = "SeeGreen"
                content.body = "\(plant.myName) needs you to check in!"
                
                let date = Date().addingTimeInterval(60 * 60 * 22)
                let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                
                let uuidString = UUID().uuidString
                let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
                center.add(request) { error in
                    print(error?.localizedDescription)
                }
                
            }
        }

        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        UserDefaults.standard.set(Date(), forKey: "LastOpened")
        LocalStorage.saveToFile(plantsList: plantsContainer)
        print("saving done")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

