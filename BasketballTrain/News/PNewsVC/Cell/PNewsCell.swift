//
//  PNewsCell.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PNewsCell: UITableViewCell {
    @IBOutlet weak var awayImg: UIImageView!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var awayWinImg: UIImageView!
    @IBOutlet weak var awayWinSeal: UIImageView!
    @IBOutlet weak var homeImg: UIImageView!
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var homeWinImg: UIImageView!
    @IBOutlet weak var homeWinSeal: UIImageView!
    @IBOutlet weak var matchDate: UILabel!
    
    private var news: News?
    
    override func prepareForReuse() {
        awayWinImg.isHidden = true
        homeWinImg.isHidden = true
        awayWinSeal.isHidden = true
        homeWinSeal.isHidden = true
        awayScore.text = "-"
        awayScore.textColor = .black
        homeScore.text = "-"
        homeScore.textColor = .black
        awayTeam.text = "-"
        homeTeam.text = "-"
    }
    
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
        awayScore.text = "\(news.awayScore)"
        homeScore.text = "\(news.homeScore)"
        if news.awayScore != news.homeScore {
            if news.awayScore > news.homeScore {
                awayScore.textColor = .red
                awayWinImg.isHidden = false
                awayWinSeal.isHidden = false
            } else {
                homeScore.textColor = .red
                homeWinImg.isHidden = false
                homeWinSeal.isHidden = false
            }
        }
        var gameDateArr = news.matchDate.components(separatedBy: " ")
        matchDate.text = gameDateArr[0]
    }
}
