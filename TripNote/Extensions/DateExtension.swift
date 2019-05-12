//
//  DateExtension.swift
//  TripNote
//
//  Created by win on 5/12/19.
//  Copyright © 2019 win. All rights reserved.
//

import Foundation

extension Date {
    func mediumDate() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from:self)
    }
}
