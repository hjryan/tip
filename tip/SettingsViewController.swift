//
//  SettingsViewController.swift
//  tip
//
//  Created by Hannah Ryan on 9/7/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("loaded")
        // Do any additional setup after loading the view.
        // Access UserDefaults
        let defaults = UserDefaults.standard
        // Get an Integer value.
        let intValue = defaults.integer(forKey: "myInt")
        // Set selected segment index to default from settings
        tipControl.selectedSegmentIndex = intValue
        
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        print("tapped")
    }
    
    @IBAction func changeDefaultTip(_ sender: Any) {
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tipPercentages = [0.18, 0.2, 0.22]
        // Set a Double value for some key.
        defaults.set(Double(tipPercentages[tipControl.selectedSegmentIndex]), forKey: "myDouble")
        defaults.set(Int(tipControl.selectedSegmentIndex), forKey: "myInt")
        // Force UserDefaults to save.
        defaults.synchronize()
        print(defaults.double(forKey: "myDouble"))
        print(defaults.integer(forKey: "myInt"))
        print("default set")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
