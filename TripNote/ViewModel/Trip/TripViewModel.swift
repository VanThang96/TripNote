//
//  TripViewModel.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
class TripViewModel {
    var trips = [
        TripModel(title: "Trip to London"),
        TripModel(title: "Trip to Paris"),
        TripModel(title: "Trip to Tokyo"),
        TripModel(title: "Trip to Dubai"),
        TripModel(title: "Trip to Bangkok")
    ]
    func getTrips() -> [TripModel] {
        return trips
    }
    func getTrip(atIndex : Int) -> TripModel {
        return trips[atIndex]
    }
    func getCount() -> Int {
        return trips.count
    }
}
