//
//  TripViewModel.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class TripViewModel {
    
    var realm = try! Realm()
    lazy var trips : Results<TripModel> = { [weak self] in
        self!.realm.objects(TripModel.self)
    }()
//    var trips = [
//        TripModel(title: "Trip to London"),
//        TripModel(title: "Trip to Paris"),
//        TripModel(title: "Trip to Tokyo"),
//        TripModel(title: "Trip to Dubai"),
//        TripModel(title: "Trip to Bangkok")
//    ]
    func addTrip(trip : TripModel){
        try! realm.write {
            realm.add(trip)
        }
    }
    func getTrips() -> [TripModel] {
        return trips.map{$0}
    }
    func getTrip(atIndex : Int) -> TripModel {
        return trips[atIndex]
    }
    func getCount() -> Int {
        return trips.count
    }
}
