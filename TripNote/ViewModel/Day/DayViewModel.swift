//
//  DayViewModel.swift
//  TripNote
//
//  Created by win on 5/8/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation
import RealmSwift

class DayViewModel {
    var realm = try! Realm()
    lazy var days : [DayModel] = { [weak self] in
//        self!.realm.objects(DayModel.self).sorted(by: { $0.title < $1.title })
        self!.realm.objects(DayModel.self).sorted(by: < )
    }()
    func addDay(day : DayModel){
        try! realm.write {
            realm.add(day, update: false)
        }
    }
    func getDays() -> [DayModel] {
        return days
    }
    func getDay(atIndex : Int) -> DayModel {
        return days[atIndex]
    }
    func getCount() -> Int {
        return days.count
    }
    func deleteDay(dayModel : DayModel){
        try! realm.write {
            realm.delete(dayModel)
        }
    }
    func updateDay(dayModel : DayModel){
        try! realm.write {
            realm.add(dayModel, update: true)
        }
    }
    func getDayWithId(with Id : String) -> DayModel?{
        return self.realm.objects(DayModel.self).first(where : { $0.id == Id})
    }
}
