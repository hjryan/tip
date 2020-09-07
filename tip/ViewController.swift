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
    }


    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

        // Access UserDefaults
        let defaults = UserDefaults.standard
        // Find default tip
        let defaultTipValue = defaults.integer(forKey: "defaultTip")
        // Set selected segment index to default from settings
        tipControl.selectedSegmentIndex = defaultTipValue
        
        // Automatically pull up keyboard & select bill field
        billAmountTextField.becomeFirstResponder()
        
        
        //Currency -- from https://supereasyapps.com/blog/2016/2/8/how-to-use-nsnumberformatter-in-swift-to-make-currency-numbers-easy-to-read
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        // Load correctly formatted zeros
        perPersonTotal.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
        tipPercentageLabel.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: 0.00))!
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
        //Currency -- from https://supereasyapps.com/blog/2016/2/8/how-to-use-nsnumberformatter-in-swift-to-make-currency-numbers-easy-to-read
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        
        //Get the initial bill amount and tip percentages
        let bill = Double(billAmountTextField.text!) ?? 0
        print(bill)
        let tipPercentages = [0.18, 0.2, 0.22]
        //Calculate the tip and total cost
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //Get party size & display
        partySizeLabel.text = String(Int(partySize.value))
        //Get total per person in party & display
        perPersonTotal.text = currencyFormatter.string(from: NSNumber(value: total/Double(Int(partySize.value))))!
        //Update the tip and total labels
        tipPercentageLabel.text = currencyFormatter.string(from: NSNumber(value: tip))!
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))!
    }
}

