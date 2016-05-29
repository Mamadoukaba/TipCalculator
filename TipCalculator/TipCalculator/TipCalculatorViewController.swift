//
//  TipCalculatorViewController.swift
//  TipCalculator
//
//  Created by Mamadou Kaba on 5/27/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var indivdualResultsLabel: UILabel!
    
    
    //MARK: - Properties
    
    var tipCalc = TipCalc(amountBeforeTax: 25.00, tipPercentage: 0.2, split: 2)
    
    //MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountBeforeTaxTextField.text = String(format: "%0.2f", arguments: [tipCalc.amountBeforeTax])
        tipPercentageLabel.text = String(format: "Tip %d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
        indivdualResultsLabel.text = String(format: "Each: $%0.2f", arguments:[(tipCalc.totalAmount / numberOfPeopleSlider.value)])
        numberOfPeopleLabel.text = "\(Int(numberOfPeopleSlider.value))"
        
    }
 
    func calcTip() {
        
        tipCalc.tipPercentage = Float(tipPercentageSlider.value)
        tipCalc.amountBeforeTax = ((amountBeforeTaxTextField.text)! as NSString).floatValue
        tipCalc.numberOfPeople = Int(numberOfPeopleSlider.value)
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        resultsLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", tipCalc.totalAmount, tipCalc.tipAmount)
        indivdualResultsLabel.text = String(format: "Each: $%0.2f", tipCalc.totalAmountPerPeople)
        
    }
    
    // MARK: - UIControl Events
    
    // Amount Before Tax Text Field Control Events
    
    @IBAction func amountBeforeTaxTextFieldChanged(sender: AnyObject) {

        calcTip()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == amountBeforeTaxTextField {
            textField.resignFirstResponder()
            calcTip()
        }
        
        return true
    }
    
    //Tip Percentage Label Control Events
    
    @IBAction func tipPercentageSliderValueChanged(sender: AnyObject) {
        tipPercentageLabel.text = String(format: "Tip %02d%%:", arguments: [Int(tipCalc.tipPercentage * 100)])
        calcTip()
    }
    
    // Split Label Control Events
    @IBAction func splitNumberChanged(sender: AnyObject) {
        numberOfPeopleLabel.text = "\(Int(numberOfPeopleSlider.value))"
        calcTip()
    }
    
    
    
 
   
}