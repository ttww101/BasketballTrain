//
//  SimGameQuarterCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameQuarterCell: UITableViewCell {
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    @IBOutlet weak var hQuarter1: UILabel!
    @IBOutlet weak var hQuarter2: UILabel!
    @IBOutlet weak var hQuarter3: UILabel!
    @IBOutlet weak var hQuarter4: UILabel!
    @IBOutlet weak var aQuarter1: UILabel!
    @IBOutlet weak var aQuarter2: UILabel!
    @IBOutlet weak var aQuarter3: UILabel!
    @IBOutlet weak var aQuarter4: UILabel!
    
    @IBOutlet weak var hQView3: UIView!
    @IBOutlet weak var hQView4: UIView!
    @IBOutlet weak var aQView3: UIView!
    @IBOutlet weak var aQView4: UIView!
    @IBOutlet weak var qView3: UILabel!
    @IBOutlet weak var qView4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func hideQuarter() {
        hQView3.isHidden = true
        hQView4.isHidden = true
        aQView3.isHidden = true
        aQView4.isHidden = true
        qView3.isHidden = true
        qView4.isHidden = true
    }

}
