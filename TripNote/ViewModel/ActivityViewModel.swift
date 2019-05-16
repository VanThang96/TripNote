//
//  ActivityViewModel.swift
//  TripNote
//
//  Created by win on 5/16/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class ActivityViewModel {
    var realm = try! Realm()
    lazy var activities : [ActivityModel] = { [weak self] in
        self!.realm.objects(ActivityModel.self).map({$0})
        }()
    func addActivity(activity : ActivityModel){
        try! realm.write {
            realm.add(activity, update: false)
        }
    }
    func getActivity(dayId : String ,atIndex : Int) -> ActivityModel {
        return activities.filter{$0.dayId == dayId}[atIndex]
    }
    func getCount(dayId : String) -> Int {
        return activities.filter{$0.dayId == dayId}.count
    }
    func deleteActivity(activity : ActivityModel){
        try! realm.write {
            realm.delete(activity)
        }
    }
    func updateActivity(activity : ActivityModel){
        try! realm.write {
            realm.add(activity, update: true)
        }
    }
}
