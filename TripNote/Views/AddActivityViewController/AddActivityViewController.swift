//
//  AddActivityViewController.swift
//  TripNote
//
//  Created by win on 5/12/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var txtWhatAreYouDoing: UITextField!
    @IBOutlet weak var txtDescriptions: UITextField!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet var btnActivityType: [UIButton]!
    
    var dayViewModel = DayViewModel()
    var activityViewModel = ActivityViewModel()
    var tripId : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    @IBAction func handleActivityPicker(_ sender: UIButton) {
        btnActivityType.forEach({ $0.tintColor = UIColor.darkGray })
        sender.tintColor = UIColor.red
    }
    @IBAction func handleCancelPopup(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleSavePopup(_ sender: Any) {
        let dayPickerindex = pickerView.selectedRow(inComponent: 0)
        let dayPickerId = dayViewModel.getDay(tripId: tripId, atIndex: dayPickerindex).id
        let activityPicker = getSelectedActivity()
        
        // check title and description valid
        guard txtWhatAreYouDoing.hasValue , let whatareyoudoing = txtWhatAreYouDoing.text else {
            return
        }
        guard txtDescriptions.hasValue , let description = txtDescriptions.text else {
            return
        }
        activityViewModel.addActivity(activity: ActivityModel(title: whatareyoudoing, subTitle: description, activityType: activityPicker, dayId: dayPickerId!))
        dismiss(animated: true, completion: nil)
    }
    fileprivate func setupUI(){
        pickerView.delegate = self
        pickerView.dataSource = self
        txtDescriptions.delegate = self
        txtWhatAreYouDoing.delegate = self
        cardView.borderForView()
        txtWhatAreYouDoing.addBoderAndShadown()
        txtDescriptions.addBoderAndShadown()
        btnSave.boderButton()
        btnCancel.boderButton()
    }
    fileprivate func getSelectedActivity() -> ActivityType {
        for (index,button) in btnActivityType.enumerated() {
            if button.tintColor == UIColor.red {
                switch index {
                case 0:
                    return ActivityType.auto
                case 1:
                    return ActivityType.excursion
                case 2:
                    return ActivityType.flight
                case 3:
                    return ActivityType.food
                case 4:
                    return ActivityType.hotel
                default:
                    return ActivityType.excursion
                }
            }
        }
       return ActivityType.excursion
    }
}
extension AddActivityViewController :UIPickerViewDelegate , UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dayViewModel.getCount(tripId: tripId)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dayViewModel.getDay(tripId: tripId, atIndex: row).title.mediumDate()
    }
}
extension AddActivityViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
