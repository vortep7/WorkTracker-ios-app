//
//  NotificationManager.swift
//  WorkTracker
//
//  Created by Андрей Петров on 18.04.2024.
//

import Foundation
import UserNotifications

class NotificationManager:NotificationProtocol {
    
    func scheduleDailyNotifications(completion: @escaping (Bool, Error?) -> ()) {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Хорошего дня!"
        content.body = "Не забудьте посмотреть свои задачи на сегодня."
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "GoodMorningCategory"
        
        if let imageURL = Bundle.main.url(forResource: "yes", withExtension: "png") {
            do {
                let attachment = try UNNotificationAttachment(identifier: "imageAttachment", url: imageURL, options: nil)
                content.attachments = [attachment]
            } catch {
                print("Ошибка при создании вложения для изображения: \(error.localizedDescription)")
            }
        }
        
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 00
        let trigger1 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        dateComponents.hour = 18
        let trigger2 = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request1 = UNNotificationRequest(identifier: "MorningNotification", content: content, trigger: trigger1)
        let request2 = UNNotificationRequest(identifier: "EveningNotification", content: content, trigger: trigger2)
        
        center.add(request1) { error in
            if let error = error {
                completion(false, error)
                print("Ошибка в утреннем")
            } else {
                print("Утреннее добавлено")
            }
        }
        
        center.add(request2) { error in
            if let error = error {
                completion(false, error)
                print("Ошибка в вечернем")
            } else {
                print("Вечернее добавлено")
            }
        }
    }
    
}

protocol NotificationProtocol {
    func scheduleDailyNotifications(completion: @escaping (Bool, Error?) -> ())
}
