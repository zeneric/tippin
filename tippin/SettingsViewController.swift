//
//  SettingsViewController.swift
//  tippin
//
//  Created by Eric Huang on 2/5/15.
//  Copyright (c) 2015 Eric Huang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var presetTax1 = defaults.valueForKey("presetTax1") as? Int
        var presetTax2 = defaults.valueForKey("presetTax2") as? Int
        var presetTax3 = defaults.valueForKey("presetTax3") as? Int
        
        tip1TextField.text = String(format: "%d", presetTax1!)
        tip2TextField.text = String(format: "%d", presetTax2!)
        tip3TextField.text = String(format: "%d", presetTax3!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveSettings(sender: AnyObject) {
        defaults.setInteger(tip1TextField.text.toInt()!, forKey: "presetTax1")
        defaults.setInteger(tip2TextField.text.toInt()!, forKey: "presetTax2")
        defaults.setInteger(tip3TextField.text.toInt()!, forKey: "presetTax3")
        
        defaults.synchronize()
    }
}
