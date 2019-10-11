//
//  Protocols.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/9/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import Foundation

protocol BackgroundColorDelegate: AnyObject {
    func darkModeOn()
    func darkModeOff()
    
}

protocol GearScrollDelegate: AnyObject {
    func setHorizantal()
    func setVertical()
}
