//
//  ViewController.swift
//  Converty
//
//  Created by Marwan Khalid on 12/28/18.
//  Copyright © 2018 Marwan Khalid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var Decimal: UIButton!
    @IBOutlet weak var Binary: UIButton!
    
    let placeholder = NSAttributedString(string: "Enter a Value ...", attributes: [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1),NSAttributedString.Key.font:UIFont(name: "Menlo", size: 30.0)!])
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.attributedPlaceholder = placeholder
        
        TextField.addTarget(self, action: #selector(TextFieldTextIsChanged), for: .editingChanged)
        DisableButton()
        
    }
    @IBAction func BinaryButtonWasPressed(_ sender: Any) {
        if TextField.text != ""{
            Binary.alpha = 1.0
            Decimal.alpha = 0.5
            guard let string = TextField.text, let intFromString = Int(string) else { fatalError()}
            let BinaryDigit = BinaryDecimal(intFromString)
            TextField.text = "\(BinaryDigit.CalculateBinaryValueFromInt())"
        }
    }
    @IBAction func DecimalButtonWasPressed(_ sender: Any) {
        if TextField.text != "" {
            Binary.alpha = 0.5
            Decimal.alpha = 1.0
            guard let string = TextField.text else {fatalError()}
            let BitsFromString = string.map { Int(String($0))! }
            let BinaryDigit = BinaryDecimal(BitsFromString)
            TextField.text = "\(BinaryDigit.CalculateIntValueForBinary())"
        }
    }
    @objc func TextFieldTextIsChanged() {
        if TextField.text == "" {
            DisableButton()
        }
        else {
            EnableButton()
        }
    }
    func EnableButton (){
        Binary.isEnabled = true
        Binary.alpha = 1.0
        Decimal.isEnabled = true
        Decimal.alpha = 1.0
    }
    func DisableButton (){
        Binary.isEnabled = false
        Binary.alpha = 0.5
        Decimal.isEnabled = false
        Decimal.alpha = 0.5
    }
}

