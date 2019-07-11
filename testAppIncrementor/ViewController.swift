//
//  ViewController.swift
//  testAppIncrementor
//
//  Created by Alexandr Malafienko on 04/07/2019.
//  Copyright © 2019 Alexandr Malafienko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberTextField: UITextField!
    
    @IBOutlet var countLabel: UILabel!
    
    let incrementor = Incrementor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCurrentValue()
    }

    @IBAction func upAction() {
        incrementor.incrementNumber()
        updateCurrentValue()
    }
    
    func updateCurrentValue() {
        let formatedText = String(format: "Result: %@", String(incrementor.getNumber()))
        countLabel.text = formatedText
    }
    
    func undateInvalidFormat() {
        countLabel.text = "Invalid input format"
    }
    
    func validation(text: String) -> Bool {
        do {
            let regEx = try NSRegularExpression(pattern: "^\\-?[0-9]\\d{0,2}$", options: [])
            let matches = regEx.matches(in: text, range: NSRange(location: 0, length: text.count))
            if !matches.isEmpty {
                return true
            } else {
                return false
            }
        } catch _ {
            return false
        }
    
    }
    
    @IBAction func numberChangeAction(_ sender: UITextField) {
    
    }
    
    @IBAction func resultAction() {
        guard let text = numberTextField.text, let number = Int(text) else { return }
        if incrementor.maxValue == number { return }
        if validation(text: text) {
            incrementor.setMax(number)
            incrementor.incrementNumber()
            updateCurrentValue()
        } else {
            undateInvalidFormat()
        }
        numberTextField.text?.removeAll()
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"-0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
    
}

