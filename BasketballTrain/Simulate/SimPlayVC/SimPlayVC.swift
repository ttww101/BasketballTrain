//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayModel {
    var home: String
    var away: String
    var quarter: Int
    var min: Int
    var stop: Int
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeStop: UILabel!
    @IBOutlet weak var homeFoul: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayStop: UILabel!
    @IBOutlet weak var awayFoul: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    
    @IBOutlet weak var quarterLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var restImg: UIImageView!
    
    var proGRecord: ProGRecordModel!
    var simPlayModel: SimPlayModel!
    var manager: SimPlayManager!
    var quarter = 1 {
        didSet {
            quarterLabel.text = "\(quarter)"
        }
    }
    var time = 0 {
        didSet {
            let strTime = time.toTimeString()
            minLabel.text = strTime.0
            secondLabel.text = strTime.1
        }
    }
    var score1 = 0 {
        didSet {
            homeScore.text = "\(score1)"
        }
    }
    var score2 = 0 {
        didSet {
            awayScore.text = "\(score2)"
        }
    }
    var stop1 = 0 {
        didSet {
            homeStop.text = "\(stop1)"
        }
    }
    var stop2 = 0 {
        didSet {
            awayStop.text = "\(stop2)"
        }
    }
    var foul1 = 0 {
        didSet {
            homeFoul.text = "\(foul1)"
        }
    }
    var foul2 = 0 {
        didSet {
            awayFoul.text = "\(foul2)"
        }
    }
    var timer: Timer?
    var nowStop = false
    var nowRest = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let team1 = teamRecordModel(name: simPlayModel.home, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, FTM: 0, threePM: 0, twoPM: 0)
        let team2 = teamRecordModel(name: simPlayModel.away, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, FTM: 0, threePM: 0, twoPM: 0)
        proGRecord = ProGRecordModel(team1: team1, team2: team2, quarter: simPlayModel.quarter, gameDate: nil)
        manager = SimPlayManager()
        setDefault()
        restImg.loadGif(name: "gamestop")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefault()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        registerTimer()
    }
    // MARK: - Default
    func setDefault() {
        homeName.text = simPlayModel.home
        awayName.text = simPlayModel.away
        score1 = 0
        score2 = 0
        quarter = 1
        time = simPlayModel.min * 60
    }
    
    // MARK: - Game
    func recordGame() {
        switch quarter {
        case 1:
            proGRecord.team1.quarter1 = manager.homequarter
            proGRecord.team2.quarter1 = manager.awayquarter
        case 2:
            proGRecord.team1.quarter2 = manager.homequarter
            proGRecord.team2.quarter2 = manager.awayquarter
        case 3:
            proGRecord.team1.quarter3 = manager.homequarter
            proGRecord.team2.quarter3 = manager.awayquarter
        case 4:
            proGRecord.team1.quarter4 = manager.homequarter
            proGRecord.team2.quarter4 = manager.awayquarter
        default:
            return
        }
        proGRecord.team1.FTM += manager.homeFTM
        proGRecord.team1.twoPM += manager.homeTwoPM
        proGRecord.team1.threePM += manager.homeThreePM
        
        proGRecord.team2.FTM += manager.awayFTM
        proGRecord.team2.twoPM += manager.awayTwoPM
        proGRecord.team2.threePM += manager.awayThreePM
        manager.reset()
    }
    func showStopView(_ type: stopType) {
        switch type {
        case .homeStop:
            restBtn.setTitle("主队暂停    结束", for: .normal)
        case .awayStop:
            restBtn.setTitle("客队暂停    结束", for: .normal)
        case .rest:
            restBtn.setTitle("中场休息    结束", for: .normal)
        }
        restView.isHidden = false
    }
    
    // MARK: - timer
    func releaseTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func registerTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runGamePlay(_:)), userInfo: nil, repeats: true)
    }
    
    @objc func runGamePlay(_ timer: Timer) -> Void {
        if time == 0 {
            releaseTimer()
            recordGame()
            if quarter < simPlayModel.quarter {
                showStopView(.rest)
                nowRest = true
                return
            }
            let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
            
            guard let simGameOverVC = desVC as? SimGameOverVC else { return }
            
            simGameOverVC.proGRecordModel = proGRecord
            simGameOverVC.openCell = true
            
            self.present(simGameOverVC, animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
            return
        }
        time -= 1
    }

    // MARK: - UI Event
    @IBAction func addTwoPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .two)
            score1 += 2
        case 1:
            manager.addPoint(.away, .two)
            score2 += 2
        default:
            return
        }
    }
    
    @IBAction func addThreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .three)
            score1 += 3
        case 1:
            manager.addPoint(.away, .three)
            score2 += 3
        default:
            return
        }
    }
    
    @IBAction func addFreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .free)
            score1 += 1
        case 1:
            manager.addPoint(.away, .free)
            score2 += 1
        default:
            return
        }
    }
    
    @IBAction func minusTwoPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .two) {[weak self] (success) in
                if success { self?.score1 -= 2 }
            }
        case 1:
            manager.minusPoint(.away, .two) {[weak self] (success) in
                if success { self?.score2 -= 2 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusThreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .three) {[weak self] (success) in
                if success { self?.score1 -= 3 }
            }
        case 1:
            manager.minusPoint(.away, .three) {[weak self] (success) in
                if success { self?.score2 -= 3 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusFreePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .free) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .free) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if stop1 < simPlayModel.stop {
                stop1 += 1
                releaseTimer()
                nowStop = true
                showStopView(.homeStop)
            }
        case 1:
            if stop2 < simPlayModel.stop {
                stop2 += 1
                releaseTimer()
                nowStop = true
                showStopView(.awayStop)
            }
        default:
            return
        }
    }
    
    @IBAction func foulPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            foul1 += 1
        case 1:
            foul2 += 1
        default:
            return
        }
    }
    
    @IBAction func restBtnPressed(_ sender: UIButton) {
        if nowStop {
            registerTimer()
            restView.isHidden = true
            nowStop = false
        } else {
            quarter += 1
            stop1 = 0
            stop2 = 0
            time = simPlayModel.min * 60
            registerTimer()
            restView.isHidden = true
            nowRest = false
        }
    }
}
