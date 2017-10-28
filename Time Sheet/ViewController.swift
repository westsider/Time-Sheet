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
    
    @IBOutlet weak var jobName: UITextField!
    
    @IBOutlet weak var totalForToday: UILabel!
    
    @IBOutlet weak var startTimeTextField: UITextField!
    
    @IBOutlet weak var lunchTextField: UITextField!
    
    @IBOutlet weak var wrapTextField: UITextField!
    
    @IBOutlet weak var totalForJob: UILabel!
    
    var jobInfo = JobInfo()
    
    var startTime:Date?
    
    var endTime:Date?
    
    //var overtimePay:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimeTextField.delegate = self
        lunchTextField.delegate = self
        wrapTextField.delegate = self
        lunchTextField.text = "1"
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
        
        startTime = sender.date
        
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
    
////////////////////////////////////////
    @objc func wrapPickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        wrapTextField.text = dateFormatter.string(from: sender.date)
        
        endTime = sender.date
        
        calcDailyEarnings()
    }
    
    func calcDailyEarnings() {
        var lunch = Int(lunchTextField.text!)
        if lunch == 1 { lunch = 60 }
        let seconds = endTime?.timeIntervalSince(startTime!)
        var minuteTotal = Int(seconds! / 60) - lunch!
        let hours = Int(minuteTotal / 60)
        let minLeft = minuteTotal - ( hours * 60 )
        if minuteTotal > 1500 { minuteTotal = 30 }
        var display = ("\(hours) Hours, \(minLeft) min")
        print(display)
        if ( hours < 10)  {
            display = "$1200"
        } else {
            
            if ( hours <= 12 ) {
                let timeAndHalf = Double(hours - 10)
                //print("OT \(timeAndHalf)")
                let timeAndHalfrate = 120 * 1.5
                let overtimePay = timeAndHalf * timeAndHalfrate
                //print("Overtime \(overtimePay)")
                let totalPay = 1200 + overtimePay
                print("OT \(timeAndHalf) Overtime \(String(describing: overtimePay)) total pay \(totalPay)")
                display = ("\(hours):\(minLeft) $\(totalPay)")
            }
            
            if ( hours > 12 ) {
                //overtimePay = 360
                let doubleTimeRate = Double( 120 * 2 )
                let doubleTime = Double(hours - 12)
                let overtimePay = 360 + ( doubleTime * doubleTimeRate )
                let totalPay = 1200 + overtimePay
                print("DT \(doubleTime) Overtime \(String(describing: overtimePay)) total pay \(totalPay)")
                display = ("\(hours):\(minLeft) $\(totalPay)")
            }
            //MARK: - TODO calc minutes for ot
            
            
        }
        totalForToday.text = display
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

