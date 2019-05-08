//
//  ActivityTableViewCell.swift
//  TripNote
//
//  Created by win on 5/4/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    // MARK: IBOutlet
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imvActivity: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    
    // MARK: var
    var activity : ActivityModel? {
        didSet{
            imvActivity.image = getActivityImageView(activityType: ActivityType(rawValue: (activity?.activityType)!)!)
            lbTitle.text = activity?.title
            lbSubTitle.text = activity?.subTitle
        }
    }
    //MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: Method
    fileprivate func setupUI(){
        cardView.addShadowAndRoundedCorners()
    }
    func getActivityImageView(activityType : ActivityType) -> UIImage {
        switch activityType {
        case .auto:
            return UIImage(named: "icon_car")!
        case .excursion:
            return UIImage(named: "icon_excursion")!
        case .flight:
            return UIImage(named: "icon_flight")!
        case .food:
            return UIImage(named: "icon_food")!
        case .hotel:
            return UIImage(named: "icon_hotel")!
        }
    }
}
