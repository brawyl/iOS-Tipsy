//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Brandon Wylie on 2020-06-25.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var tipsyResults: TipsyResults?
    
    func getAmount() -> String {
        return String(format: "%.2f", tipsyResults?.amount ?? 0.0)
    }
    
    func getSummary() -> String {
        return tipsyResults?.summary ?? ""
    }
    
    mutating func calculateAmount(bill: Float, tip: String, people: Int) {
        let tipPct = (tip as NSString).floatValue / 100
        let amount = bill * (1.0 + tipPct) / Float(people)
        let summaryString = String(format:"Split between %d people with ", people) + tip + " tip."
        tipsyResults = TipsyResults(amount: amount, summary: summaryString)
    }
    
}
