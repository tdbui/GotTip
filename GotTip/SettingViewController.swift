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
    
    @IBOutlet weak var colorControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let curr_tip = defaults.string(forKey: "tip") ?? "0.18"
        
        // setting default tip amount
        switch curr_tip {
        case "0.2":
            tipControl.selectedSegmentIndex = 1
        case "0.25":
            tipControl.selectedSegmentIndex = 2
        default:
            tipControl.selectedSegmentIndex = 0
        }
        
        
        // setting default color theme
        let curr_color = defaults.string(forKey: "color") ?? "day"
        
        switch curr_color {
            case "blue":
                colorControl.selectedSegmentIndex = 1
            case "green":
                colorControl.selectedSegmentIndex = 2
            default:
                colorControl.selectedSegmentIndex = 0
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
    


    @IBAction func settingColorDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        let color_themes = ["day", "blue", "green"]
        
        let default_color = color_themes[colorControl.selectedSegmentIndex]
        defaults.set(default_color, forKey: "color")
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
