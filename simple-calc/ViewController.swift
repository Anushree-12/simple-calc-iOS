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
    var counter = 0
    //var numAverage = 0
    
//    func average(_ x: Double...) -> Double {
//        var num: Double = 0
//        for i in x {
//            num = num + i
//        }
//
//        let count = Double(x.count)
//        let result = num/count
//        return result
//    }
//
//    func count() {
//        return
//    }
    
    @IBOutlet weak var lblOutput: UILabel!
    
    @IBAction func btnNumber(_ sender: UIButton) {
        if mathOperation == true {
            lblOutput.text = String(sender.tag - 1)
            currentNumber = Double(lblOutput.text!)!
            mathOperation = false
        } else {
            lblOutput.text = lblOutput.text! + String(sender.tag - 1)
            currentNumber = Double(lblOutput.text!)!
        }
    }
    
    @IBAction func btnOperation(_ sender: UIButton) {
        
        if lblOutput.text != "" && sender.tag != 18 && sender.tag != 20 && sender.tag != 11 {
            prevNumber = Double(lblOutput.text!)!
            operationType = sender.tag
            mathOperation = true
            
            if operationType == 13 {
                counter = counter + 1
            }
            
        } else if sender.tag == 11{ // Fact
            if prevNumber == 0 {
                lblOutput.text = "1"
            }  else {
                var number = 1
                for i in 1...prevNumber {
                    number = number * Double(i)
                }
                lblOutput.text = String(number)
            }
        } else if sender.tag == 18 {
//            if operationType == 12 { // Avg
//
//                 lblOutput.text = average()
//
//            }
            if operationType == 13 { // Count
                lblOutput.text = String(counter + 1)
            } else if operationType == 14 { // Divide
                lblOutput.text = String(prevNumber / currentNumber)
            } else if operationType == 15 { // Multiply
                lblOutput.text = String(prevNumber * currentNumber)
            } else if operationType == 16 { // Minus
                lblOutput.text = String(prevNumber - currentNumber)
            } else if operationType == 17 { // Add
                lblOutput.text = String(prevNumber + currentNumber)
            } else if operationType == 19 { // Mod
                lblOutput.text = String(prevNumber.truncatingRemainder(dividingBy: currentNumber))
            }
        } else if sender.tag == 20 {
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

