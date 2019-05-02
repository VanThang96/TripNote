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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTripModel()
        setupView()
        
        tbViewActivities.dataSource = self
        tbViewActivities.delegate = self
    }
}
extension ActivitiesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel.dayModels[section].activityModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath )
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel.dayModels.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title =  tripModel.dayModels[section].title ?? ""
        let subTitle = tripModel.dayModels[section].subTitle ?? ""
        
        return "\(title) \(subTitle)"
    }
}
extension ActivitiesViewController : UITableViewDelegate{
    
}
