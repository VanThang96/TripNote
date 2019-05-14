//
//  TripModel.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class TripModel : Object {
    @objc dynamic var id : String!
    @objc dynamic var title : String!
    @objc dynamic var image : Data!
    
    convenience init(title : String , image : UIImage) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.image = convertImagetoData(withImage: image)
    }
    convenience init(title : String ) {
        self.init()
        self.id = UUID().uuidString
        self.title = title
    }
    override static func primaryKey() -> String? {
        return "id"
    }
    func convertImagetoData(withImage : UIImage) -> Data?{
        let imageToData = UIImage.jpegData(withImage)
        return imageToData(0.5)
    }
}
