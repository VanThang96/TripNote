//
//  TripModel.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class TripModel : Object {
    @objc dynamic var id : UUID!
    @objc dynamic var title : String!
    
    convenience init(title : String) {
        self.init()
        self.id = UUID()
        self.title = title
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}
