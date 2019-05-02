//
//  UIViewExtension.swift
//  TripNote
//
//  Created by win on 4/22/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

extension UIView {
    func addShadowAndRoundedCorners(){
        layer.shadowOpacity = 0.75
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.cornerRadius = 10
    }
    func borderForView(){
        layer.cornerRadius = 16
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 235/255, alpha: 1)
    }
}
