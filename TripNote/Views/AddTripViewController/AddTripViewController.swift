//
//  AddTripViewController.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    // MARK : IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtAddTrip: UITextField!
    
    // MARK : var
    var doneSaving : (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        firstSetupView()
    }
    
    // MARK : IBAction
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
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
