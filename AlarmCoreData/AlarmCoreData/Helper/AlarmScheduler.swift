//
//  AlarmScheduler.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import Foundation
import UserNotifications

protocol AlarmScheduler: AnyObject {
    func scheduleUserNotification(for alarm: Alarm)
    func cancelUserNotification(for alarm: Alarm)
}

extension AlarmScheduler {
    func scheduleUserNotification(for alarm: Alarm) {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Wakey wakey sleepy head!"
        
        content.body = "Your alarm: \(alarm.title!) is running!"
        
        content.sound = UNNotificationSound.default
        
        let components = Calendar.current.dateComponents([.hour, .minute, .second], from: alarm.fireDate!)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(identifier: alarm.uuidString!, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Error scheduling user notifications: \(error.localizedDescription) : \(error)")
            }
        }
    }
    
    func cancelUserNotification(for alarm: Alarm) {
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.uuidString!])
    }
} 
