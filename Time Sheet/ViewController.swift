//
//  ViewController.swift
//  Time Sheet
//
//  Created by Warren Hansen on 10/27/17.
//  Copyright © 2017 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var jobName: UIButton!
    
    @IBOutlet weak var totalForToday: UILabel!
    
    @IBOutlet weak var callTIme: UILabel!
    
    @IBOutlet weak var lunch: UILabel!
    
    @IBOutlet weak var wrapTime: UILabel!
    
    @IBOutlet weak var totalForJob: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeJobNameAction(_ sender: Any) {
    }
    
    @IBAction func changeCallAction(_ sender: Any) {
    }
    
    @IBAction func changeLunchAction(_ sender: Any) {
    }
    
    @IBAction func updateAction(_ sender: Any) {
    }
    
    @IBAction func listJobsAction(_ sender: Any) {
    }
}

