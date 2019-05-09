//
//  HeaderView.swift
//  TripNote
//
//  Created by win on 5/3/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {
    
    //MARK: IBOulet
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    
    //MARK: var
    var dayModel : DayModel? {
        didSet{
            lbTitle.text = dateFormatter(date: (dayModel?.title)!)
            lbSubTitle.text = dayModel?.subTitle
        }
    }
    
    //MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    fileprivate func dateFormatter(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from:date)
    }
}
