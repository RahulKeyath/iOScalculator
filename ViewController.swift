//
//  ViewController.swift
//  Calculator
//
//  Created by Rahul Krishnan M on 07/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            plusButton.setTitle("+", for: .normal)
            minusButton.setTitle("-", for: .normal)
            multiplyButton.setTitle("×", for: .normal)
            divideButton.setTitle("÷", for: .normal)
    }
        @IBOutlet weak var plusButton: UIButton!
        @IBOutlet weak var minusButton: UIButton!
        @IBOutlet weak var multiplyButton: UIButton!
        @IBOutlet weak var divideButton: UIButton!

    
    @IBOutlet weak var firstNumberTextField: UITextField!
    
    @IBOutlet weak var secondNumberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var selectedOperation: String = ""
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let operation = sender.currentTitle, !operation.isEmpty {
            selectedOperation = operation
            print("Selected Operation: \(selectedOperation)")
        } else {
            print("Error: Operation button not recognized")
        }
    }
    
    @IBAction func calculateResult(_ sender: UIButton) {
        guard let firstNumberText = firstNumberTextField.text, !firstNumberText.isEmpty,
              let secondNumberText = secondNumberTextField.text, !secondNumberText.isEmpty,
              let firstNumber = Double(firstNumberText),
              let secondNumber = Double(secondNumberText) else {
            resultLabel.text = "Invalid Input"
            print("Error: One or both input fields are empty or non-numeric")
            return
        }

        print("First Number: \(firstNumber), Second Number: \(secondNumber), Operation: \(selectedOperation)")

        var result: Double = 0
        
        switch selectedOperation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "×":
            result = firstNumber * secondNumber
        case "÷":
            if secondNumber == 0 {
                resultLabel.text = "Error: Division by zero"
                print("Error: Division by zero")
                return
            }
            result = firstNumber / secondNumber
        default:
            resultLabel.text = "Select an operation"
            print("Error: No operation selected")
            return
        }

        resultLabel.text = "Result: \(result)"
        print("Result: \(result)")
    }
    @IBAction func clearAllPressed(_ sender: UIButton) {
        firstNumberTextField.text = ""
        secondNumberTextField.text = ""
        resultLabel.text = "0"
        selectedOperation = ""  // Reset the operation
        print("✅ All fields cleared")
    }
}
