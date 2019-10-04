//
//  ViewController.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/4/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoView: UICollectionView!
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addPhotos = storyboard.instantiateViewController(withIdentifier: "addPhotoEntryVC") as? addPhotoEntryVC
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

