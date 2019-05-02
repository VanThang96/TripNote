//
//  TripViewController.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit
import SQLite3

class TripViewController: UIViewController {
    
    // MARK : IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var helpView: UIVisualEffectView!
    @IBOutlet weak var btnCloseHelpView: UIButton!
    
    // MARK : let
    let cellId = "cellId"
    fileprivate let  segueAddTrip = "toAddTripsegue"
    let seenHelpView = "seenHelpView"
    
    // MARK : var
    var tripViewModel : TripViewModel!
    var tripIndexToEdit : Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tripViewModel = TripViewModel()
        
        addButton.createFloatingActionButton()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setupHelpView()
    }
    // MARK : IBAction
    @IBAction func closeHelpView(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {[weak self] in
            self!.helpView.alpha = 0
        }) { [weak self](bool) in
            self!.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self!.seenHelpView)
        }
    }
    
    //MARK : Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueAddTrip {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndexToEdit = nil
        }
    }
    fileprivate func setupHelpView(){
        guard tripViewModel.getCount() > 0 else {
            return
        }
        if UserDefaults.standard.bool(forKey: seenHelpView) == false {
            btnCloseHelpView.layer.cornerRadius = btnCloseHelpView.frame.height / 2
            helpView.frame = view.frame
            view.addSubview(helpView)
        }
    }
}
// MARK : TableViewDataSource
extension TripViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripViewModel.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TripTableViewCell
        cell?.trip = tripViewModel.getTrip(atIndex: indexPath.row)
        return cell!
    }
}
// MARK : TableViewDelegate
extension TripViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self](contextualAction, view, actionPerForm : @escaping (Bool) -> Void) in
            let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete trip ?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                actionPerForm(false)
            }))
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [weak self](action) in
                // Perforn delete
                if let trip = self?.tripViewModel.getTrip(atIndex: indexPath.row){
                    self?.tripViewModel.deleteTrip(tripModel: trip)
                }
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerForm(true)
            }))
            self?.present(alert, animated: true, completion: nil)
        }
        delete.image = UIImage(named: "delete")
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit") { [weak self](contextualAction, view, actionPerform : (Bool) -> Void) in
            self?.tripIndexToEdit = indexPath.row
            self?.performSegue(withIdentifier: self!.segueAddTrip, sender: nil)
            actionPerform(true)
        }
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [edit])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = tripViewModel.getTrip(atIndex: indexPath.row)
        
        let storyboard = UIStoryboard(name: "ActivitiesViewController", bundle: nil)
        let activitesViewController = storyboard.instantiateViewController(withIdentifier: "ActivitiesViewController") as! ActivitiesViewController
        activitesViewController.tripId = trip.id
        
        navigationController?.pushViewController(activitesViewController, animated: true)
    }
}
