//
//  AlarmDetailTableViewController.swift
//  AlarmCoreData
//
//  Created by River McCaine on 1/21/21.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    // MARK: - Outlets
    @IBOutlet weak var alarmFireDatePicker: UIDatePicker!
    @IBOutlet weak var alarmTitleTextField: UITextField!
    
    @IBOutlet weak var alarmIsEnabledButton: UIButton!
    
    
    // MARK: - Properties
    var alarm: Alarm?
    var isAlarmOn: Bool = true
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func alarmIsEnabledButtonTapped(_ sender: UIButton) {
        if let alarm = alarm {
            AlarmController.shared.toggleIsEnabled(alarm: alarm)
            isAlarmOn = alarm.isEnabled
        } else  {
            isAlarmOn = !isAlarmOn
        }
        designIsEnabledButton()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let alarmTitle = alarmTitleTextField.text, !alarmTitle.isEmpty else { return }
        
        if let alarm = alarm {
            AlarmController.shared.update(alarm: alarm, newTitle: alarmTitle, newFireDate: alarmFireDatePicker.date, isEnabled: isAlarmOn)
        } else {
            AlarmController.shared.createAlarm(withTitle: alarmTitle, fireDate: alarmFireDatePicker.date)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let alarm = alarm else { return }
        alarmFireDatePicker.date = alarm.fireDate ?? Date()
        alarmTitleTextField.text = alarm.title
        isAlarmOn = alarm.isEnabled
        designIsEnabledButton()
    }
    
    func designIsEnabledButton() {
        switch isAlarmOn {
        case true:
            alarmIsEnabledButton.backgroundColor = .white
            alarmIsEnabledButton.setTitle("On", for: .normal)
        case false:
            alarmIsEnabledButton.backgroundColor = .darkGray
            alarmIsEnabledButton.setTitle("Off", for: .normal)
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }



}
