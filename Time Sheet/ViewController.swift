//
//  ViewController.swift
//  Time Sheet
//
//  Created by Warren Hansen on 10/27/17.
//  Copyright © 2017 Warren Hansen. All rights reserved.
//

import UIKit

class JobInfo {
    var name: String?
    var startTime:Date?
    var lunchDuration:Double?
    var wrapTime:Date?
    var currentProfit:Double?
    var todaysProfit:Double?
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var jobInfo = JobInfo()
    
    @IBOutlet weak var jobName: UITextField!
    
    @IBOutlet weak var totalForToday: UILabel!
    
    @IBOutlet weak var startTimeTextField: UITextField!
    
    @IBOutlet weak var lunchTextField: UITextField!
    
    @IBOutlet weak var wrapTextField: UITextField!
    
    @IBOutlet weak var totalForJob: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimeTextField.delegate = self
        lunchTextField.delegate = self
        wrapTextField.delegate = self
    }

    @IBAction func dateFeildEditing(_ sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        startTimeTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @IBAction func editLunch(_ sender: UITextField) {
        print("Lunch tapped \(String(describing: lunchTextField.text))")
    }
    
    @IBAction func wrapTimeEtiting(_ sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(ViewController.wrapPickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func wrapPickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        wrapTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @IBAction func updateAction(_ sender: Any) {
        
        jobInfo.name = jobName.text
        debugPrint(jobInfo)
    }
    
    @IBAction func listJobsAction(_ sender: Any) {
    }
    
    // MARK: - Keyboard behavior functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        startTimeTextField.resignFirstResponder()
        return true
    }
    
}

