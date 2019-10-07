//
//  ViewController.swift
//  PhotoJounralProject
//
//  Created by Pursuit on 10/4/19.
//  Copyright © 2019 Neema Philippe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var photos = [Photo]() {
        didSet {
            DispatchQueue.main.async {
                self.photoView.reloadData()
            }
            
        }
    }

    @IBOutlet weak var photoView: UICollectionView!
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addPhotos = storyboard.instantiateViewController(withIdentifier: "addPhotoEntryVC") as? addPhotoEntryVC
        
        addPhotos?.modalPresentationStyle = .fullScreen
        present(addPhotos!, animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
      loadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.dataSource = self
        photoView.delegate = self
        for photo in photos {
            print("Name: \(photo.description), ID:\(photo.id)")
        }
    }
    
    func presentsActionSheet(id: Int){
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            self.deletePhoto(with: id)
        })
        //This is a closure. When the delete button is pressed, we are performing some kind of closure action. In this case, we are running our deletePhotos function.
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(deleteAction)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func deletePhoto(with id: Int) {
        do {
            try PhotosPersistenceHelper.manager.deletePhoto(specificID: id)
        } catch {}
        do {
            self.photos = try PhotosPersistenceHelper.manager.getPhotos()
        } catch {}
    }
    
    
    private func loadData() {
        do {
            photos =  try PhotosPersistenceHelper.manager.getPhotos()
        } catch {
            print(error)
        }
    }
}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let specificPhoto = photos[indexPath.row]
        let cell = photoView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        cell.photoCellImage.image = UIImage(data: specificPhoto.image)
        cell.photoDescriptionLabel.text = specificPhoto.description
        cell.buttonFunction = {self.presentsActionSheet(id: specificPhoto.id)}
        cell.dateLabel.text = specificPhoto.date
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout { //has function in it that lets us adjust size/dimensions of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 460)
    }
}

