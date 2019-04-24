//
//  UIButtonExtension.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton(){
        layer.cornerRadius = frame.width / 2
        backgroundColor = .red
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 8)
    }
    func boderButton(){
        layer.cornerRadius = frame.height / 2
        setTitleColor(.white, for: .normal)
    }
}
