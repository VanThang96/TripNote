//
//  AddTripViewController.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit
import Photos

class AddTripViewController: UIViewController {
    
    // MARK : IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtAddTrip: UITextField!
    @IBOutlet weak var imvPhotoTrip: UIImageView!
    
    // MARK : var
    var doneSaving : (()->())?
    var tripViewModel : TripViewModel!
    var tripIndexToEdit : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripViewModel = TripViewModel()
        imvPhotoTrip.layer.cornerRadius = 10
        imvPhotoTrip.clipsToBounds = true
        // Do any additional setup after loading the view.
        firstSetupView()
        
        if let index = tripIndexToEdit {
            let trip = tripViewModel.getTrip(atIndex: index)
            txtAddTrip.text = trip.title
            if trip.image != nil {
                imvPhotoTrip.image = UIImage(data: trip.image!)
            }
        }
    }
    
    // MARK : IBAction
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        
        // check new Trip Name valid
        guard txtAddTrip.text != "" , let newTripName = txtAddTrip.text else {
            txtAddTrip.addInvalidImage()
            return
        }
        
        if let index = tripIndexToEdit { // case edit
            let trip = tripViewModel.getTrip(atIndex: index)
            let id = trip.id
            if imvPhotoTrip.image == nil  {
                let trip = TripModel(title: newTripName)
                trip.id = id
                tripViewModel.updateTrip(tripModel: trip)
            } else {
                let trip = TripModel(title: newTripName, image: imvPhotoTrip.image)
                trip.id = id
                tripViewModel.updateTrip(tripModel: trip)
            }
        }else {                     //case add
            if imvPhotoTrip.image == nil  {
                let trip = TripModel(title: newTripName)
                tripViewModel.addTrip(trip: trip)
            } else {
                let trip = TripModel(title: newTripName, image: imvPhotoTrip.image)
                tripViewModel.addTrip(trip: trip)}
        }
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization { [unowned self](status) in
                switch status {
                case .authorized:
                    self.handleImagePickerAuthorized()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.handleImagePickerAuthorized()
                    }
                case .restricted :
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo library access is restricted and cannot be accessed", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                case .denied :
                    let alert = UIAlertController(title: "Photo Library Access Denied", message: "Photo library access was previously denied. Please update your Settings if you wish to change this", preferredStyle: .alert)
                    let gotoSettingAction = UIAlertAction(title: "Go to Settings", style: .default, handler: { (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    })
                    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
                    alert.addAction(gotoSettingAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    fileprivate func handleImagePickerAuthorized(){
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.allowsEditing = true
        myImagePickerController.sourceType = .photoLibrary
        myImagePickerController.delegate = self
        self.present(myImagePickerController, animated: true, completion: nil)
    }
    fileprivate func firstSetupView(){
        cardView.borderForView()
        btnSave.boderButton()
        btnCancel.boderButton()
        txtAddTrip.addBoderAndShadown()
    }
}
extension AddTripViewController:  UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtAddTrip {
            textField.resignFirstResponder()
        }
        return true
    }
}
extension AddTripViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imvPhotoTrip.image = image
        } else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imvPhotoTrip.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
