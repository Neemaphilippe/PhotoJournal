//
//  SettingsVC.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/9/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var backgroundSwitch: UISwitch!
    weak var delegate: SettingsDelegate?
    
    @IBAction func backgroundColorSwitchPressed(_ sender: UISwitch) {
        switch sender.isOn {
        
        case true:
            setDarkMode(setting: .on)
        case false:
            setDarkMode(setting: .off)
        }
    }
        
    
    private func setDarkMode(setting: DarkModeSetting) {
        switch setting {
        case .on :
            delegate?.darkModeOn()
        case .off:
            delegate?.darkModeOff()
        }
    }
    

    
    @IBOutlet weak var scrollSwitch: UISwitch!
    
    @IBAction func scrollViewSwitchPressed(_ sender: UISwitch) {
        
    }
    
    
    enum DarkModeSetting: String {
        case on
        case off
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
