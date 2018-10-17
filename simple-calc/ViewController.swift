//
//  ViewController.swift
//  simple-calc
//
//  Created by Anushree Gopal on 10/16/18.
//  Copyright © 2018 Anushree Gopal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNumber: Double = 0
    var prevNumber: Double = 0
    var mathOperation = false
    var operationType = 0
    
    func fact(_ x: Int) -> Double {
        if x == 0 {
            return 1
        }
        var num: Double = 1
        for i in 1...x {
            num = num * Double(i)
        }
        return num
    }
    
    func average(_ x: Double...) -> Double {
        var num: Double = 0
        for i in x {
            num = num + i
        }
        
        let count = Double(x.count)
        let result = num/count
        return result
    }
    
    func count() {
        return
    }
    
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if mathOperation == true {
            lblOutput.text = String(sender.tag)
            currentNumber = Double(lblOutput.text!)!
            mathOperation = false
        } else {
            lblOutput.text = lblOutput.text! + String(sender.tag)
            currentNumber = Double(lblOutput.text!)!
            
        }
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        if lblOutput.text != "" && sender.tag != 17 && sender.tag != 18 {
            prevNumber = Double(lblOutput.text!)!
            operationType = sender.tag
            mathOperation = true
            
        } else if sender.tag == 17 {
            if operationType == 10 { // Fact
                lblOutput.text = fact()
            } else if operationType == 11 { // Avg
                lblOutput.text = average()
            } else if operationType == 12 { // Count
                lblOutput.text = count()
                // FIX THESE OPERATIONS!! INCLUDE THE CORRECT MATH
                
            } else if operationType == 13 { // Divide
                lblOutput.text = String(prevNumber / currentNumber)
            } else if operationType == 14 { // Multiply
                lblOutput.text = String(prevNumber * currentNumber)
            } else if operationType == 16 { // Minus
                lblOutput.text = String(prevNumber - currentNumber)
            } else if operationType == 17 { // Add
                lblOutput.text = String(prevNumber + currentNumber)
            } else if operationType == 20 { // Mod
                lblOutput.text = String(prevNumber.truncatingRemainder(dividingBy: currentNumber))
            }
        } else if sender.tag == 18 {
            lblOutput.text = ""
            prevNumber = 0
            currentNumber = 0
            operationType = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

