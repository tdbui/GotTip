//
//  SettingViewController.swift
//  GotTip
//
//  Created by Tuan Bui on 3/12/17.
//  Copyright © 2017 Tuan Bui. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func settingDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let default_tip = tipPercentages[tipControl.selectedSegmentIndex]
        defaults.set(default_tip, forKey: "tip")
        defaults.synchronize()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
