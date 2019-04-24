//
//  TripViewController.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit


class TripViewController: UIViewController {

    // MARK : IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK : let
    let cellId = "cellId"
    
    // MARK : var
    var tripViewModel : TripViewModel!
    
    //MARK : Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.createFloatingActionButton()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tripViewModel = TripViewModel()
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
        return 160
    }
}
