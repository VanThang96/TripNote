//
//  HeaderView.swift
//  TripNote
//
//  Created by win on 5/3/19.
//  Copyright © 2019 win. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
