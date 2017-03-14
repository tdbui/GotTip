//
//  ViewController.swift
//  GotTip
//
//  Created by Tuan Bui on 3/11/17.
//  Copyright © 2017 Tuan Bui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //default the text labels to $0.00
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        twoLabel.text = "$0.00"
        threeLabel.text = "$0.00"
        fourLabel.text = "$0.00"

        
        //raise the decimal pad as soon as it opens
        billField.becomeFirstResponder()
        
        //write the placeholder text
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        billField.attributedPlaceholder = NSAttributedString(string: formatter.string(from: 0)!)
        
        
        let defaults = UserDefaults.standard
        if(defaults.string(forKey: "bill") != nil) {
            let past = defaults.object(forKey: "time")!
            if(NSDate().timeIntervalSinceReferenceDate - (past as AnyObject).timeIntervalSinceReferenceDate < 60 * 10) {
                billField.text = defaults.string( forKey: "bill") as String!
            }
        }
        
    }


    @IBAction func calculateTip(_ sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip() {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = Double(bill + tip)
        
        let two_people = total / 2
        let three_people = total / 3
        let four_people = total / 4
        
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        tipLabel.text = formatter.string(for: tip)
        totalLabel.text = formatter.string(for: total)
        twoLabel.text = formatter.string(for : two_people)
        threeLabel.text = formatter.string(for : three_people)
        fourLabel.text = formatter.string(for : four_people)
        
        //tipLabel.text = String(format: "$%.2f", tip)
        //totalLabel.text = String(format: "$%.2f", total)
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let curr_tip = defaults.string(forKey: "tip") ?? "0.18"
        
        switch curr_tip {
            case "0.2":
                tipControl.selectedSegmentIndex = 1
            case "0.25":
                tipControl.selectedSegmentIndex = 2
            default:
                tipControl.selectedSegmentIndex = 0
        }
        
        let curr_color = defaults.string(forKey: "color") ?? "day"
        changeColor(newColor: curr_color)
        calculateTip()
    }
    
    func changeColor(newColor: String) {
        if(newColor == "blue") {
            self.view.backgroundColor = UIColor(red: 0, green: 1, blue: 1, alpha: 1)
            self.view.tintColor = UIColor.blue
        }
        else if(newColor == "green") {
            self.view.backgroundColor = UIColor(red: 0.61, green: 1, blue: 0.46, alpha: 1)
            self.view.tintColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.white
            self.view.tintColor = UIColor.blue        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
  
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("view will disappear")
    
        let defaults = UserDefaults.standard
        defaults.set(billField.text, forKey: "bill")
        defaults.set(NSDate(), forKey: "time")
        defaults.synchronize()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

}

