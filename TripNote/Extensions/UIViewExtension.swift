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
        clipsToBounds = true
    }
    func borderForView(){
        layer.cornerRadius = 16
        backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 235/255, alpha: 1)
    }
    func makeGradientColorInCardView(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(named: "Purple_900")!.cgColor, UIColor(named: "Purple_700")!.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
