//
//  Notifications.swift
//  Calmy
//
//  Created by Никита Олтян on 02.06.2021.
//

import Foundation
import UserNotifications

class Notifications {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization(){
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if didAllow {
                self.setUpLocalNotifications()
            } else {
                print("User has declined notifications")
            }
        }
    }
    
    func setUpLocalNotifications(){
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = NSLocalizedString("notification_title", comment: "")
        notificationContent.body = NSLocalizedString("notification_body", comment: "")
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .default
                        
        var datComp = DateComponents()
        datComp.hour = 20
        datComp.minute = 01
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: true)
        let request = UNNotificationRequest(identifier: "ID", content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error : Error?) in
            if let theError = error {
                print(theError.localizedDescription)
            }
        }
    }
}
