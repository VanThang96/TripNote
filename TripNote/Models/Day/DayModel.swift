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
    @objc dynamic var title : String!
    @objc dynamic var subTitle : String!
    let activityModels = List<ActivityModel>()
    
    convenience init(title : String , subTitle : String) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}
