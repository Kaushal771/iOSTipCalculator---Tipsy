//
//  ViewController.swift
//  Tipsy
//
//  Created by Kaushal Desai on 2021-07-31.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tenPctBttn: UIButton!
    @IBOutlet weak var fifteenPctBttn: UIButton!
    @IBOutlet weak var splitNumLabel: UILabel!
    @IBOutlet weak var twentyPctBttn: UIButton!
    
    var tipSelected: Float = 0.0
    var finalTotal: String = ""
    
    

    @IBAction func tipChanged(_ sender: UIButton) {
        
        
        if tenPctBttn.isHighlighted == true {
            tenPctBttn.isSelected = true
            fifteenPctBttn.isSelected = false
            twentyPctBttn.isSelected = false
        }
        else if fifteenPctBttn.isHighlighted == true {
            fifteenPctBttn.isSelected = true
            tenPctBttn.isSelected = false
            twentyPctBttn.isSelected = false
        }
        else if twentyPctBttn.isHighlighted == true {
            twentyPctBttn.isSelected = true
            fifteenPctBttn.isSelected = false
            tenPctBttn.isSelected = false
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValChanged(_ sender: UIStepper) {
        
        splitNumLabel.text = String(format: "%.0f", sender.value)
        
        
    }
    @IBAction func calculateBttnPressed(_ sender: UIButton) {
        
        
        
        if tenPctBttn.isSelected {
            
            tipSelected = 0.1
        }
        else if fifteenPctBttn.isSelected {
           
            tipSelected = 0.15
        }
        else if twentyPctBttn.isSelected {
           
            tipSelected = 0.20
        }
        
        
        
        print(calculatePerPersonTotal(billTotal: Float(billTextField.text!)!, tip: tipSelected, split: Float(splitNumLabel.text!)!))
        
        finalTotal = calculatePerPersonTotal(billTotal: Float(billTextField.text!)!, tip: tipSelected, split: Float(splitNumLabel.text!)!)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
        
    }
    
    func calculatePerPersonTotal(billTotal: Float, tip: Float, split: Float) -> String {
        
        let perPersonTotal = (billTotal + (billTotal * tip)) / split
        let perPersonTotalString = String(format: "%0.2f", perPersonTotal)
        
        return perPersonTotalString
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipPercent = Int(tipSelected)
            destinationVC.numOfPpl = splitNumLabel.text
            destinationVC.total = finalTotal
            
        }
    }
    
    
}

