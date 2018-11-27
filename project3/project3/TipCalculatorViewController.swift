//
//  TipCalculatr.swift
//  project3
//
//  Created by Selin Ersev on 23.11.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    var tipCalculator = TipCalculator()
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        tipPercentage.text = "$0.00"
        tipPercentageLabel.text = "Tip%"
        totalResultLabel.text = "$0.00"
        billTextField.text = ""
        tipPercentageSlider.value = 50
    }
    
    @IBAction func tipSliderChange(_ sender: Any) {
        tipPercentageLabel.text = String(format: "Tip%%(%d)", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
        //self.view.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        self.hideKeyboardWhenSwipe()
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: false)
        
        billTextField.inputAccessoryView = toolBar
    }
    
    func calculateBill(){
        tipCalculator.tipPercentage = Double(Int(tipPercentageSlider.value)) / 100
        guard let billText = billTextField.text, let bill = Double(billText.replacingOccurrences(of: "$", with: "")) else{return}
        tipCalculator.billBeforeTip = bill
        tipCalculator.calculateTotal()
        tipCalculator.calculateTip()
        populateUI()
    }
    
    func populateUI(){
        tipPercentage.text = String(format: "$%0.2f", tipCalculator.tipAmount)
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.total)
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
        guard let billText = billTextField.text, let bill = Double(billText.replacingOccurrences(of: "$", with: "")) else{return}
        billTextField.text = String(format: "$%0.2f", bill)
        calculateBill()
    }
    
  
}

extension TipCalculatorViewController {
    func hideKeyboardWhenSwipe() {
        let swipe: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(TipCalculatorViewController.dismissKeyboard))
        swipe.cancelsTouchesInView = false
        swipe.direction = .down
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(swipe)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
