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
        // do any additional setup after loading the view.
        
        // access UserDefaults
        let defaults = UserDefaults.standard
        // access defaultTip
        let defaultTipValue = defaults.integer(forKey: "defaultTip")
        // set selected segment to saved default
        tipControl.selectedSegmentIndex = defaultTipValue
        
        // format view controller from https://stackoverflow.com/questions/42667744/swift-how-to-set-default-text-color-for-uisegmentedcontrol
        // selected option color
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .selected)
        // color of other options
        tipControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray], for: .normal)
    }
    
    @IBAction func changeDefaultTip(_ sender: Any) {
        // access UserDefaults
        let defaults = UserDefaults.standard
        // save selected segment
        defaults.set(Int(tipControl.selectedSegmentIndex), forKey: "defaultTip")
        // force UserDefaults to save
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
