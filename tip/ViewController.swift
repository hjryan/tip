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
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        // Access UserDefaults
        let defaults = UserDefaults.standard
        // Get an Integer value.
        let intValue = defaults.integer(forKey: "myInt")
        // Set selected segment index to default from settings
        tipControl.selectedSegmentIndex = intValue
        // Automatically pull up keyboard & select bill field
        billAmountTextField.becomeFirstResponder()
        
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
        //Get the initial bill amount and tip percentages
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [0.18, 0.2, 0.22]
        //Calculate the tip and total cost
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        //Get party size & display
        partySizeLabel.text = String(Int(partySize.value))
        //Get total per person in party & display
        perPersonTotal.text = String(format: "$%.2f", total/Double(Int(partySize.value)))
        //Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

