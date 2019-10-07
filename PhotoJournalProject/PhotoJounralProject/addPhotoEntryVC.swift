//
//  addPhotoEntryVC.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/4/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class addPhotoEntryVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    //MARK: -- Outlets
    @IBOutlet weak var photoTextView: UITextView!
    @IBOutlet weak var photoImage: UIImageView!
    
    //MARK: --IBActions
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
       savesPhotos()
    }
    @IBAction func photoLibraryPressed(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        self.present(image, animated: true)
        
        
    }
    
    //MARK: -- Functions
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoImage.image = image
        } else {
            print("Error")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func savesPhotos(){
        guard let photoDescriptionText = photoTextView.text else { return }
        guard let image = photoImage.image else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        let newPhoto = Photo(description: photoDescriptionText, image: imageData, date: Photo.getDate(), id: Photo.getIDForNewPhoto() )
        
        do {
            try? PhotosPersistenceHelper.manager.savePhoto(photo: newPhoto)
        }
        
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}


