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
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescriptions: UITextField!
    
    // MARK: var
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
        
        // check title and description valid
        guard txtTitle.hasValue , let title = txtTitle.text else {
            return
        }
        
        guard txtDescriptions.hasValue , let description = txtDescriptions.text else {
            return
        }
        
        // check if title and description valid then add DayModel
        dayViewModel.addDay(day: DayModel(title: title, subTitle: description))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true, completion: nil)
    }
    //MARK: Method
    fileprivate func firstSetupView(){
        cardView.borderForView()
        btnSave.boderButton()
        btnCancel.boderButton()
        txtTitle.addBoderAndShadown()
        txtDescriptions.addBoderAndShadown()
    }
}
