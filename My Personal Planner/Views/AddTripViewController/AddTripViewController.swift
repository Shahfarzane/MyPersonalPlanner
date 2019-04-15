//
//  AddTripViewController.swift
//  My Personal Planner
//
//  Created by Shahin Farzane on 2019-04-10.
//  Copyright © 2019 ShahinFarzane. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextfield: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var doneSaving: (() -> ())?
    var tripIndexEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        

        
        #warning("FIX STYLE")
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
       // self.view.backgroundColor = .clear
        imageView.layer.cornerRadius = 10
        
        //Shadow on titleLabel
        
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
        
        
        if let index = tripIndexEdit {
            let trip = Data.tripModels[index]
            tripTextfield.text = trip.title
            imageView.image = trip.image
            titleLabel.text = "Edit Trip"
            
        }
        
    }
    
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        
        
        dismiss(animated: true)
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        tripTextfield.rightViewMode = .never
        guard tripTextfield.hasValue, let newTripName = tripTextfield.text else { return }
        if let index = tripIndexEdit {
            TripFunctions.updateTrip(at: index, title:newTripName , image: imageView.image)
        } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imageView.image))
        }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
        
    
            
//            let imageView = UIImageView(frame: CGRect(x:0 , y: 0 ,width: 30, height: 35 ))
//            imageView.image = UIImage(named: "warning")
//            imageView.contentMode = .scaleAspectFit
//            tripTextfield.rightView = imageView
            
            
           // tripTextfield.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)

    
    fileprivate func presentPhotoPicker() {
        let myPickerController = UIImagePickerController()
        myPickerController.allowsEditing = true
        myPickerController.allowsEditing = true
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    @IBAction func addPhotoButton(_ sender: UIButton) {
        
        
      //  if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            
            PHPhotoLibrary.requestAuthorization{ (status) in
                switch status {
                case .authorized:
                    self.presentPhotoPicker()
              case .notDetermined:
                if status == PHAuthorizationStatus.authorized {
                    self.presentPhotoPicker()
                    }

                    
               case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message:"Photo library access is restricted and cannot be accessed" , preferredStyle: .alert)
                    
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access is denied , Please go to Settings and update the settings", preferredStyle: .alert)
                    let settingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                        DispatchQueue.main.async {
                            let url = URL(string: UIApplication.openSettingsURLString)!
                            UIApplication.shared.open(url, options: [:])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(settingsAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                @unknown default:
                    fatalError()
                }
            }
        }
    }


extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageView.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

