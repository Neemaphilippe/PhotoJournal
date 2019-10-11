//
//  UserDefaults.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/11/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class UserDefaultsWrapper {
    
    static let manager = UserDefaultsWrapper()
 
    
    func saveUserPreference(backgroundColor: UIColor){
        UserDefaults.standard.set(backgroundColor, forKey: backgroundColorKey)
    }
    
    
    
    func getUserPreference()-> UIColor {
        return UserDefaults.standard.value(forKey: backgroundColorKey) as! UIColor
    }
    
    private init(){}
    private let backgroundColorKey = "backgroundColor"
    
    
    
    
    
    
    
    
}
