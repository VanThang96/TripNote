//
//  DayModel.swift
//  TripNote
//
//  Created by win on 5/1/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class DayModel : Object {
    @objc dynamic var  id : String!
    @objc dynamic var title : Date!
    @objc dynamic var subTitle : String!
    @objc dynamic var tripId : String!
    
    convenience init(title : Date , subTitle : String, tripId : String) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        self.tripId = tripId
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}
extension DayModel  : Comparable {
    static func < (lhs: DayModel, rhs: DayModel) -> Bool {
        return lhs.title < rhs.title
    }
}
