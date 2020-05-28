//
//  SimGameDetailCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameDetailCell: UITableViewCell {
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var awayLabel: UILabel!
    
    @IBOutlet weak var homeFree: UILabel!
    @IBOutlet weak var homeTwo: UILabel!
    @IBOutlet weak var homeThree: UILabel!
    
    @IBOutlet weak var awayFree: UILabel!
    @IBOutlet weak var awayTwo: UILabel!
    @IBOutlet weak var awayThree: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
