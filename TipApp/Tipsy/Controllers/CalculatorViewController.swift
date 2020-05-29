//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var stepValue = 2
    var billText = 0.0
    var sum = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
        sender.isSelected = true
        
        let sts = String(sender.currentTitle ?? "")
        let buttonT = String(sts.dropLast())
        tip = Double(buttonT) ?? 0.0
        tip = tip / 100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepValue = Int(sender.value)
        splitNumberLabel.text = String(stepValue)
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let doublText = billTextField.text ?? "Error"
        if let doubleNum = Double(doublText) {
            billText = doubleNum
        }
        
        sum = ((tip * billText) + billText) / Double(stepValue)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.totlBill = totalBill()
            destinationVC.settIngOption = settingOption()
        }
    }
    func totalBill() -> String {
        sum = ((tip * billText) + billText) / Double(stepValue)
        let calcSum = String(format: "%.2f", sum)
        return calcSum
    }
    func settingOption() -> String {
        let convert = tip * 100
        return "Split between \(stepValue) people, with \(convert)% tip"
    }
}

