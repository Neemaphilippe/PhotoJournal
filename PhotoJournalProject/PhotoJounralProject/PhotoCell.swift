//
//  PhotoCell.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/6/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photoCellImage: UIImageView!
    
    @IBOutlet weak var photoDescriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var optionsButton: UIButton!
    
    var buttonFunction: (()->Void)?
    
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
        if let closure = buttonFunction {
            closure()
        }
    }
    
    weak var delegate: BackgroundColorDelegate?
}
