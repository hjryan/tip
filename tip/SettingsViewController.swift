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
        // Access defaultTip
        let defaultTipValue = defaults.integer(forKey: "defaultTip")
        // Set selected segment to saved default
        tipControl.selectedSegmentIndex = defaultTipValue
    }
    
    @IBAction func changeDefaultTip(_ sender: Any) {
        // Access UserDefaults
        let defaults = UserDefaults.standard
        // Save selected segment
        defaults.set(Int(tipControl.selectedSegmentIndex), forKey: "defaultTip")
        // Force UserDefaults to save
        defaults.synchronize()
        print("default tip set to segment index:", defaults.integer(forKey: "defaultTip"))
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
