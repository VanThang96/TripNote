//
//  TripTableViewCell.swift
//  TripNote
//
//  Created by win on 4/19/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imvTrip: UIImageView!
    
    // MARK: var
    var trip : TripModel?{
        didSet{
            titleLabel.text = trip?.title
            if trip?.image != nil , let data = trip?.image {
                imvTrip.image = UIImage(data: data)
            }
        }
    }
    
    // MARK: Method
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCorners()
        cardView.makeGradientColorInCardView()
        imvTrip.layer.cornerRadius = 10
    }

}
