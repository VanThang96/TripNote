//
//  AddDayViewController.swift
//  TripNote
//
//  Created by win on 5/7/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class AddDayViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var txtDescriptions: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: var
    var tripId : String!
    var doneSaving : (()->())?
    var dayViewModel = DayViewModel()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        firstSetupView()
    }
    
    // MARK: IBAction
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func Save(_ sender: Any) {
        // check already of DayModel
        if dayViewModel.checkDayAlready(tripId: tripId, date: datePicker.date) {
            let alertViewController = UIAlertController(title: "Day already exists", message: "Choose another day", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertViewController.addAction(okAction)
            present(alertViewController, animated: true, completion: nil)
            return
        }
        // check title and description valid
        guard txtDescriptions.hasValue , let description = txtDescriptions.text else {
            return
        }
        
        // check if title and description valid then add DayModel
        dayViewModel.addDay(day: DayModel(title: datePicker.date, subTitle: description, tripId: tripId))

        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
    //MARK: Method
    fileprivate func firstSetupView(){
        txtDescriptions.delegate = self
        cardView.borderForView()
        btnSave.boderButton()
        btnCancel.boderButton()
        txtDescriptions.addBoderAndShadown()
    }
//    fileprivate func checkAlreadyExists(_ date : Date) -> Bool {
//        if dayViewModel.getDays().contains(where: {$0.title.mediumDate() == date.mediumDate()}) {
//            return true
//        }
//        return false
//    }
}
extension AddDayViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

