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
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions

    @IBAction func alarmIsEnabledButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Helper Functions
    
    func updateViews() {
        guard let alarm = alarm else { return }
        alarmFireDatePicker.date = alarm.fireDate ?? Date()
        alarmTitleTextField.text = alarm.title
        
    }
    
    func designIsEnabledButton() {
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }



}
