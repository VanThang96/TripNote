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
        self!.realm.objects(DayModel.self).sorted(by: < )
    }()
    func addDay(day : DayModel){
        try! realm.write {
            realm.add(day, update: false)
        }
    }
    func getDays(tripId : String) -> [DayModel] {
        return days.filter{$0.tripId == tripId}
    }
    func getDay(tripId : String ,atIndex : Int) -> DayModel {
        return days.filter{$0.tripId == tripId}[atIndex]
    }
    func getCount(tripId : String) -> Int {
        return days.filter{$0.tripId == tripId}.count
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
    func checkDayAlready(tripId : String , date : Date) -> Bool{
        let day = days.filter{$0.tripId == tripId}.contains(where: {$0.title.mediumDate() == date.mediumDate()})
        if day {
            return true
        }
        return false
    }
    func getDayWithId(with Id : String) -> DayModel?{
        return self.realm.objects(DayModel.self).first(where : { $0.id == Id})
    }
}
