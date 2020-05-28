//
//  SimGameBtnCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameBtnCell: UITableViewCell {
    
    var close: (() -> Void)?
    var save: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func closePressed(_ sender: UIButton) {
        close?()
    }
    @IBAction func savePressed(_ sender: UIButton) {
        save?()
    }
}
