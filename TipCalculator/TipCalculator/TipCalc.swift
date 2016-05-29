//
//  TipCalc.swift
//  TipCalculator
//
//  Created by Mamadou Kaba on 5/27/16.
//  Copyright © 2016 Mamadou Kaba. All rights reserved.
//

import Foundation


class TipCalc {
    
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var tipAmount: Float = 0
    var totalAmount: Float = 0
    var numberOfPeople: Int = 0
    var totalAmountPerPeople:Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float, split: Float) {
        
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = amountBeforeTax + tipAmount
        totalAmountPerPeople = (totalAmount / Float(numberOfPeople))
    }
}