//
//  FNewsCell.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class FNewsCell: UITableViewCell {
    @IBOutlet weak var awayImg: UIImageView!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var gameDate: UILabel!
    @IBOutlet weak var gameTime: UILabel!
    
    private var news: News?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupNews(_ news: News?) {
        guard let news = news else { return }
        self.news = news
        if let url = URL(string: news.awayLogoURL) {
            awayImg.kf.setImage(with: url)
        }
        if let url = URL(string: news.homeLogoURL) {
            homeImg.kf.setImage(with: url)
        }
        awayTeam.text = news.awayName
        awayTeam.adjustsFontSizeToFitWidth = true
        homeTeam.text = news.homeName
        homeTeam.adjustsFontSizeToFitWidth = true
        var gameDateArr = news.matchDate.components(separatedBy: " ")
        gameDate.text = gameDateArr[0]
        gameDate.adjustsFontSizeToFitWidth = true
        gameTime.text = gameDateArr.count > 1 ? gameDateArr[1] : nil
        
    }

}
