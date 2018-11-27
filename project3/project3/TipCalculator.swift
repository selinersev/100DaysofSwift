//
//  TipCalculator.swift
//  project3
//
//  Created by Selin Ersev on 25.11.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import Foundation

class TipCalculator {
    var billBeforeTip: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var total: Double = 0
 
    
    func calculateTip() {
        tipAmount = billBeforeTip * tipPercentage
    }
    
    func calculateTotal() {
        tipAmount = billBeforeTip * tipPercentage
        total = tipAmount + billBeforeTip
    }
}
