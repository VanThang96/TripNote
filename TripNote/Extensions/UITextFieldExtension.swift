//
//  UITextFieldExtension.swift
//  TripNote
//
//  Created by win on 4/24/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

extension  UITextField {
    func addBoderAndShadown(){
        layer.cornerRadius = frame.width / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}
