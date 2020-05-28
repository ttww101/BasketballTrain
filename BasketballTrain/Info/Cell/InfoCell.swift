//
//  InfoCell.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Kingfisher

class InfoCell: UITableViewCell {
    @IBOutlet weak var infoImg: UIImageView!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var infoDate: UILabel!
    
    private var info: Info?
    var imgfinsh: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(displayP3Red: 255/255, green: 245/255, blue: 245/255, alpha: 0.8)
        self.addSubview(backgroundView)
        self.sendSubviewToBack(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8).isActive = true
        backgroundView.layer.cornerRadius = 10
        backgroundView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupInfo(_ info: Info?) {
        guard let info = info else { return }
        self.info = info
        infoTitle.text = info.title
        infoDate.text = info.publishAt
        var s = info.thumb
        s = s.replace(target: "http://54.201.93.35:8078/weixin/index/loadImg?url=/weixin/index/loadImg?url=", withString: "")
        if let url = URL(string: s) {
            let processor = DownsamplingImageProcessor(size: infoImg.frame.size)
            infoImg.kf.indicatorType = .activity
            infoImg.kf.setImage(with: url, placeholder: nil, options: [.scaleFactor(UIScreen.main.scale), .transition(.fade(13)), .cacheOriginalImage], progressBlock: nil) {[weak self] (result) in
                self?.imgfinsh?()
            }
//            infoImg.kf.setImage(with: url)
        }
    }

}
