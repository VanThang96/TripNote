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
    
    // MARK : Var
    var tripId : String!
    var tripModel : TripModel!
    var tripViewModel  : TripViewModel!
    
    // MARK : let
    let cellId = "cellId"
    let headerCellId = "HeaderTableView"
    
    fileprivate func setupView() {
        navigationController?.navigationBar.topItem?.title = "Trips"
        
        guard let trip = tripModel else { return }
        title = trip.title
        
        guard let image = trip.image else {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTripModel()
        setupView()
        
        setupTableView()
    }
}
extension ActivitiesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath )
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let title =  tripModel.dayModels[section].title ?? ""
//        let subTitle = tripModel.dayModels[section].subTitle ?? ""
//        
//        return "\(title) \(subTitle)"
//    }
}
extension ActivitiesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        headerCell.lbTitle.text = "Title"
        headerCell.lbSubTitle.text = "subTitle"
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
}
