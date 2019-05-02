//
//  ActivityModel.swift
//  TripNote
//
//  Created by win on 5/1/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

enum ActivityType : String {
    case auto
    case excursion
    case flight
    case food
    case hotel
}

class ActivityModel : Object {
    @objc dynamic var id : String!
    @objc dynamic var title : String!
    @objc dynamic var subTitle : String!
    @objc dynamic var activityType : String!
    @objc dynamic var photo : Data!
    
    convenience init(title : String , subTitle : String , activityType : ActivityType , photo : UIImage) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
        self.activityType = activityType.rawValue
        self.photo = convertImagetoData(withImage : photo)
    }
    override static func primaryKey() -> String? {
        return "id"
    }
    func convertImagetoData(withImage : UIImage) -> Data?{
        let imageToData = UIImage.jpegData(withImage)
        return imageToData(0.5)
    }
}
