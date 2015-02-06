//
//  ViewController.swift
//  tippin
//
//  Created by Eric Huang on 2/1/15.
//  Copyright (c) 2015 Eric Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [18, 20, 22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.text = "100.0"
    }
    
    override func viewDidAppear(animated: Bool) {
        updateTipPercentages()
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        println(sender)
        var tipPercentage = Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100.0
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateTipPercentages() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let presetTax1 = defaults.objectForKey("presetTax1") as? Int {
            tipPercentages[0] = presetTax1
        } else {
            defaults.setInteger(tipPercentages[0], forKey: "presetTax1")
        }
        if let presetTax2 = defaults.objectForKey("presetTax2") as? Int {
            tipPercentages[1] = presetTax2
        } else {
            defaults.setInteger(tipPercentages[1], forKey: "presetTax2")
        }
        if let presetTax3 = defaults.objectForKey("presetTax3") as? Int {
            tipPercentages[2] = presetTax3
        } else {
            defaults.setInteger(tipPercentages[2], forKey: "presetTax3")
        }
        
        tipControl.setTitle(String(format: "\(tipPercentages[0])%%"), forSegmentAtIndex: 0)
        tipControl.setTitle(String(format: "\(tipPercentages[1])%%"), forSegmentAtIndex: 1)
        tipControl.setTitle(String(format: "\(tipPercentages[2])%%"), forSegmentAtIndex: 2)
        
        onEditingChanged(self)
    }
    
}

