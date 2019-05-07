//
//  ActivitiesViewController.swift
//  TripNote
//
//  Created by win on 5/1/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    // MARK : IBOutlet
    @IBOutlet weak var imvBackground: UIImageView!
    @IBOutlet weak var tbViewActivities: UITableView!
    @IBOutlet weak var btnActionSheet: UIButton!
    
    // MARK : Var
    var tripId : String!
    var tripModel : TripModel!
    var tripViewModel  : TripViewModel!
    var tripTitle = ""
    
    // MARK : let
    let cellId = String(describing: ActivityTableViewCell.self)

    
    fileprivate func setupView() {
        btnActionSheet.boderButton()
        
        title = tripTitle
        
        guard let trip = tripModel,let image = trip.image else {
            return
        }
        imvBackground.image = UIImage(data: image)
    }
    fileprivate func getTripModel() {
        tripViewModel = TripViewModel()
        tripModel = tripViewModel.getTripWithId(with: tripId)
    }
    
    fileprivate func setupTableView() {
        tbViewActivities.dataSource = self
        tbViewActivities.delegate = self
        
        tbViewActivities.register(UINib(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTripModel()
        setupView()
        
        setupTableView()
    }
    
    // MARK : IBAction
    @IBAction func handleActionSheet(_ sender: Any) {
        let alertAction = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleActionAddNewDay)
        let activityAction = UIAlertAction(title: "Activity", style: .default) { (action) in
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertAction.addAction(dayAction)
        alertAction.addAction(activityAction)
        alertAction.addAction(cancelAction)
        present(alertAction, animated: true, completion: nil)
    }
    func handleActionAddNewDay(action : UIAlertAction){
        let storyboard = UIStoryboard(name: String(describing: AddDayViewController.self), bundle: nil)
        let addDayVC = storyboard.instantiateInitialViewController()!
        present(addDayVC, animated: true, completion: nil)
    }
}
extension ActivitiesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath ) as! ActivityTableViewCell
        cell.activity = ActivityModel(title: "Bali", subTitle: "trip to Bali", activityType: .excursion)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}
extension ActivitiesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        headerCell.lbTitle.text = "May 6"
        headerCell.lbSubTitle.text = "Departure"
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
