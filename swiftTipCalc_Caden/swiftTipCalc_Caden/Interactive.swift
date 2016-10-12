//
//  Interactive.swift
//  swiftTipCalc_Caden
//
//  Created by Caden Cheek on 10/10/16.
//  Copyright © 2016 Interapt. All rights reserved.
//

import Foundation


class Interactive {
    private var done: Bool = false
    private var currentInput: String = "q"
    private var tipCalculator = TipCalculator()

    
    func go() {
        
        
        
        // Ask for input the first time
        tipCalculator.writeMessage("Welcome, to begin type t, to quit type q, and for help type h.")
        
        
        currentInput = tipCalculator.getInput()
        var foodCost: Double = Double(currentInput) ?? 0.00
        var taxPct: Double = Double(currentInput) ?? 0.00
        var tip: Double = Double(currentInput) ?? 0.00
        var people: Double = Double(currentInput) ?? 0
        
        while !done {
            
            if currentInput == "q" {
                done = true
                
            } else if currentInput == "t" {
                
                //Ask user for input right here.
                tipCalculator.writeMessage("\nWhat is the bill amount?")
                currentInput = tipCalculator.getInput()
                foodCost = Double(currentInput) ?? 0.00
                
                tipCalculator.writeMessage("\nWhat is the tax percent?")
                currentInput = tipCalculator.getInput()
                taxPct = Double(currentInput)!
                
                tipCalculator.writeMessage("\nHow much would you like to tip?")
                currentInput = tipCalculator.getInput()
                tip = Double(currentInput) ?? 0.00
                
                tipCalculator.writeMessage("\nHow many people are splitting the bill?")
                currentInput = tipCalculator.getInput()
                people = Double(currentInput)!
                
                let taxPercent = taxPct * 0.1
                let tipAmount = tip * 0.01
                let billAmt = foodCost * taxPercent
                let tipTotal = (tipAmount * billAmt)
                let billAmount = ((((foodCost * taxPercent) + foodCost) * tipAmount) + foodCost)
                let splitBill = (billAmount / people)
                
                tipCalculator.writeMessage("Your tip total is \(String(format: "%.02f",tipTotal))")
                tipCalculator.writeMessage("Your bill is \(String(format: "%.02f",billAmount))")
                tipCalculator.writeMessage("The amount per person is \(String(format: "%.02f", splitBill))")
                
            } else if currentInput == "h"{
                tipCalculator.writeMessage("The first question is how much was the food? you would type the total cost of the food so say $10. \nThe next question is asking the sales tax for instance in Kentucky it is 6%. \nNext you will be asked how much you would like to tip such as 10, 15, 20 percent is understood. \nLast but not least how would like like to split the bill will one be paying or more?")
                
            }
        }
        print("Exiting....")
        
        return 
    }
}
