//
//  TripModel.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation

class TripModel {
    let id : UUID!
    var title : String!
    init(title : String) {
        self.id = UUID()
        self.title = title
    }
}
