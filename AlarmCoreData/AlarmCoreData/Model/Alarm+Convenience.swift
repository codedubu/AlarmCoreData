//
//  Alarm+Convenience.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import CoreData

extension Alarm {
    
    @discardableResult convenience init(uuidString: String = UUID().uuidString, title: String, isEnabled: Bool = true, fireDate: Date, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.uuidString = uuidString
        self.title = title
        self.isEnabled = isEnabled
        self.fireDate = fireDate
    }
} // End of extension
