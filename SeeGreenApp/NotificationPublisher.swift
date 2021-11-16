//
//  NotificationPublisher.swift
//  SeeGreenApp
//
//  Created by student on 11/16/21.
//

import Foundation
import UIKit
import UserNotifications

class NotificationPublisher: NSObject {
    func sendNotifications(title: String, subtitle: String, body: String, badge: Int?, delayInterval: Int?) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        notificationContent.body = body
        notificationContent.sound = UNNotificationSound.default
        var delayTimeTrigger : UNTimeIntervalNotificationTrigger?
        if let delayInterval = delayInterval {
            delayTimeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(delayInterval), repeats: false)
        }
        if let badge = badge {
            var currentBadgeCount = UIApplication.shared.applicationIconBadgeNumber
            currentBadgeCount += badge
            notificationContent.badge = NSNumber(integerLiteral: currentBadgeCount)
        }
        let request = UNNotificationRequest(identifier: "testLocalNotification", content: notificationContent, trigger: delayTimeTrigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print(error)
            }
            UNUserNotificationCenter.current().delegate = self
        }
    }
}
extension NotificationPublisher: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("notification about to be presented")
        completionHandler([.badge, .sound, .alert])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let identifier = response.actionIdentifier
        switch identifier {
        case UNNotificationDismissActionIdentifier :
            print("notification was dismissed")
            completionHandler()
        case UNNotificationDefaultActionIdentifier :
            print("user opened app from notification")
            completionHandler()
        default :
            print("default case was called")
            completionHandler()
        }
    }
}
