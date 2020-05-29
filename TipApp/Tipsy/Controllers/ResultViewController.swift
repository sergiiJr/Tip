 //
 //  ResultViewController.swift
 //  Tipsy
 //
 //  Created by Sergii Bala on 5/27/20.
 //  Copyright © 2020 The App Brewery. All rights reserved.
 //
 
 import UIKit
 
 class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totlBill = ""
    var settIngOption = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totlBill
        settingsLabel.text = settIngOption
        
    }
    @IBAction func recalculateButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
 }
