//
//  DateHelper.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}
