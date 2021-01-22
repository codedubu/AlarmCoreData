//
//  AlarmTableViewCell.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import UIKit

protocol AlarmTableViewCellDelegate: AnyObject {
    func alarmWasToggled(sender: AlarmTableViewCell)
}

class AlarmTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var alarmTitleLabel: UILabel!
    @IBOutlet weak var alarmFireDateLabel: UILabel!
    @IBOutlet weak var isEnabledSwitch: UISwitch!
    
    // MARK: - Properties
    // Delegate
    weak var delegate: AlarmTableViewCellDelegate?
    
    // MARK: - Actions
    @IBAction func isEnabledSwitchToggled(_ sender: UISwitch) {
        
        delegate?.alarmWasToggled(sender: self)
        
        
    }
    
    // MARK: - Helper Functions
    func updateViews(alarm: Alarm) {
        alarmTitleLabel.text = alarm.title
        alarmFireDateLabel.text = alarm.fireDate!.stringValue()
        isEnabledSwitch.isOn = alarm.isEnabled
    }
    
} // End of class


