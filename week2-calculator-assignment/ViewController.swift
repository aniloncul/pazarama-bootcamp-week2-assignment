//
//  ViewController.swift
//  week2-calculator-assignment
//
//  Created by Anıl Öncül on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numOnScreen: UILabel!
    
    @IBOutlet weak var secondayLabel: UILabel!
    
    @IBOutlet var calcButtons: [UIButton]!
    
    var historyArray = [String]()
    
    
    var firstNum: String = ""
    var operation: String = ""
    var secondNum: String = ""
    var haveResult: Bool = false
    var result: String = ""
    var numAfterResult = ""
    
    @IBAction func add(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func subtract(_ sender: Any) {
        operation = "-"
    }
    
    
    @IBAction func multiply(_ sender: Any) {
        operation = "*"
    }
    
    @IBAction func divide(_ sender: Any) {
        operation = "/"
    }
    
    @IBAction func equals(_ sender: Any) {
        result = String(didOperation())
        numOnScreen.text = result
        numAfterResult = ""
    }
    
    @IBAction func squareRoot(_ sender: Any) {
        var number: Double = Double(numOnScreen.text!)!
        number = sqrt(number)
        numOnScreen.text = String(number)
        
    }
    
    @IBAction func fractionValue(_ sender: Any) {
        var number: Double = Double(numOnScreen.text!)!
        if number != 0 {
            number = 1 / number
            numOnScreen.text = String(number)
        } else {
            print("You cant do that")
        }
    }
    
    
    @IBAction func logarithm(_ sender: Any) {
        var number: Double = Double(numOnScreen.text!)!
        number = log10(number)
        numOnScreen.text = String(number)
    }
    
    
    
    func didOperation() -> Double {
        
        if operation == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            } else {
                return Double(result)! + Double(numAfterResult)!
            }
        }
        else if operation == "-" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
            } else {
                return Double(result)! - Double(numAfterResult)!
            }
        }
        else if operation == "*" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
            } else {
                return Double(result)! * Double(numAfterResult)!
            }
        }
        else if operation == "/" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
            } else {
                return Double(result)! / Double(numAfterResult)!
            }
        }
        historyArray.append(operation)
        
        return 0
    }
        
    
    
    @IBAction func numPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag)
            numOnScreen.text = firstNum
            historyArray.append(firstNum)
            
                        
        }
        else if operation != "" && !haveResult {
            secondNum += String(sender.tag)
            numOnScreen.text = secondNum
            historyArray.append(secondNum)
        }
        else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            historyArray.append(String(sender.tag))
            numOnScreen.text = numAfterResult
        }
        print(historyArray)
        showHistory()
        
    }

  
    @IBAction func operationPressed(_ sender: UIButton) {
        let operatorTitle = sender.titleLabel?.text
        
        if let operatorTitle = (operatorTitle) {
            historyArray.append(operatorTitle)
        } else {
            return
        }
        
        print(historyArray)
        showHistory()
    }
    
    
    @IBAction func clear(_ sender: UIButton) {
        firstNum = ""
        operation = ""
        secondNum = ""
        haveResult = false
        result = ""
        numAfterResult = ""
        numOnScreen.text = "0"
        historyArray.removeAll()
        secondayLabel.text = "0"
    }
    
    func showHistory() {
        secondayLabel.text = "\(historyArray.joined())"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButtons {
            button.layer.cornerRadius = button.frame.height / 2
            
        }
    }
    

}

 
