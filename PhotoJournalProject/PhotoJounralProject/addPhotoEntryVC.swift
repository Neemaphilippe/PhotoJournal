//
//  addPhotoEntryVC.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/4/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class addPhotoEntryVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBOutlet weak var photoTextView: UITextView!
    
    
    @IBOutlet weak var photoImage: UIImageView!
    
    
    @IBAction func photoLibraryPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(image, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoImage.image = image
        } else {
            print("Error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraPressed(_ sender: Any) {
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    



}
//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        guard let image = info[.originalImage] as? UIImage else {return}
////        photoImage = image
//
//        dismiss(animated: true, completion: nil)
//    }
//
//}

