//
//  ViewController.swift
//  tip
//
//  Created by Hannah Ryan on 8/23/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var partySize: UISlider!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var perPersonTotal: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // things I want to do only on initial load
        
        // format zeroes on initial load
        // currency -- from https://supereasyapps.com/blog/2016/2/8/how-to-use-nsnumberformatter-in-swift-to-make-currency-numbers-easy-to-read
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        // load correctly formatted zeros
        perPersonTotal.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
        tipPercentageLabel.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
        
        // automatically pull up keyboard & select bill field
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func onTap(_ sender: Any) {
        // get rid o' keyboard
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // things I want to do whenever loading main view

        // access UserDefaults
        let defaults = UserDefaults.standard
        // find default tip
        let defaultTipValue = defaults.integer(forKey: "defaultTip")
        // set selected segment index to default from settings
        tipControl.selectedSegmentIndex = defaultTipValue
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    

    
    @IBAction func calculateTip(_ sender: Any) {
        // currency -- from https://supereasyapps.com/blog/2016/2/8/how-to-use-nsnumberformatter-in-swift-to-make-currency-numbers-easy-to-read
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        // get the initial bill amount
        // declare bill -- handle both inputs XXX.XX & XXX,XX
        var bill : Double
        var billText = String(billAmountTextField.text ?? "")
        // XXX,XX
        if (billText.contains(",")){
            billText = billText.replacingOccurrences(of: ",", with: ".")
            bill = Double(billText) ?? 0
        }
        // XXX.XX, nil, XXX
        else {
            bill = Double(billAmountTextField.text!) ?? 0
        }
        // create list of tip options in segments
        let tipPercentages = [0.18, 0.2, 0.22]
        // find user-selected tip percentage
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        // calculate tip amount & display
        let tip = bill * tipPercentage
        tipPercentageLabel.text = currencyFormatter.string(from: NSNumber(value: tip))!
        // calculate total amount & display
        let total = bill + tip
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))!
        // find user-selected party size & display
        let size = Int(partySize.value)
        partySizeLabel.text = String(size)
        // calculate total amount per person in party & display
        let perPerson = total/Double(size)
        perPersonTotal.text = currencyFormatter.string(from: NSNumber(value: perPerson))!
        
    }
}

