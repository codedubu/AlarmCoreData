//
//  AlarmController.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import CoreData

class AlarmController: AlarmScheduler {
    // MARK: - Shared Instance
    static let shared = AlarmController()
    
    // MARK: - SOT
    var alarms: [Alarm] = []
    
    // MARK: - Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Alarm> = {
        let request = NSFetchRequest<Alarm>(entityName: "Alarm")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - Crud
    func createAlarm(withTitle title: String, fireDate: Date) {
        let newAlarm = Alarm(title: title, fireDate: fireDate)
        alarms.append(newAlarm)
        scheduleUserNotification(for: newAlarm)
        CoreDataStack.saveContext()
    }
    
    func fetchAlarm() {
        self.alarms = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func update(alarm: Alarm, newTitle: String, newFireDate: Date, isEnabled: Bool) {
        alarm.title = newTitle
        alarm.fireDate = newFireDate
        alarm.isEnabled = isEnabled
        scheduleUserNotification(for: alarm)
        CoreDataStack.saveContext()
    }
    
    func toggleIsEnabled(alarm: Alarm) {
        alarm.isEnabled.toggle()
        alarm.isEnabled ? scheduleUserNotification(for: alarm) : cancelUserNotification(for: alarm)
        CoreDataStack.saveContext()
    }
    
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        alarms.remove(at: index)
        cancelUserNotification(for: alarm)
        CoreDataStack.context.delete(alarm)
        CoreDataStack.saveContext()
    }

// Another way to do it
//    func saveToPersistentStore() {
//        do {
//            try CoreDataStack.context.save()
//        } catch {
//            print(" Error to saving to persistence store \(error)")
//        }
//    }
} // End of class
