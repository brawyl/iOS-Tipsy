//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct: String = "10%"
    var splitNumber: Int = 2
    var billTotal: Float = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //reset all selected states
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        //set selected state of pressed button
        sender.isSelected = true
        tipPct = sender.currentTitle!
        //close the keyboard
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = String(splitNumber)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = (billTextField.text! as NSString).floatValue
        calculatorBrain.calculateAmount(bill: billTotal, tip: tipPct, people: splitNumber)
                
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = calculatorBrain.getAmount()
            destinationVC.summary = calculatorBrain.getSummary()
        }
    }
    
}

