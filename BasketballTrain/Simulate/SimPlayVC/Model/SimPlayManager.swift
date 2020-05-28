//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum teamType {
    case home, away
}

enum scoreType {
    case free, two, three
}

class SimPlayManager {
    var homequarter = 0
    var homeFTM = 0
    var homeTwoPM = 0
    var homeThreePM = 0
    
    var awayquarter = 0
    var awayFTM = 0
    var awayTwoPM = 0
    var awayThreePM = 0
    
    init() {
        reset()
    }
    
    func reset() {
        homequarter = 0
        homeFTM = 0
        homeTwoPM = 0
        homeThreePM = 0
        
        awayquarter = 0
        awayFTM = 0
        awayTwoPM = 0
        awayThreePM = 0
    }
    
    func addPoint(_ team: teamType, _ score: scoreType) {
        switch team {
        case .home:
            switch score {
            case .free:
                homeFTM += 1
                homequarter += 1
            case .two:
                homeTwoPM += 1
                homequarter += 2
            case .three:
                homeThreePM += 1
                homequarter += 3
            }
        case .away:
            switch score {
            case .free:
                awayFTM += 1
                awayquarter += 1
            case .two:
                awayTwoPM += 1
                awayquarter += 2
            case .three:
                awayThreePM += 1
                awayquarter += 3
            }
        }
    }
    
    func minusPoint(_ team: teamType, _ score: scoreType, _ completion: @escaping(Bool) -> Void) {
        switch team {
        case .home:
            switch score {
            case .free:
                if homeFTM > 0 {
                    homeFTM -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .two:
                if homeTwoPM > 0 {
                    homeTwoPM -= 1
                    homequarter -= 2
                    completion(true)
                } else { completion(false) }
            case .three:
                if homeThreePM > 0 {
                    homeThreePM -= 1
                    homequarter -= 3
                    completion(true)
                } else { completion(false) }
            }
        case .away:
            switch score {
            case .free:
                if awayFTM > 0 {
                    awayFTM -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .two:
                if awayTwoPM > 0 {
                    awayTwoPM -= 1
                    awayquarter -= 2
                    completion(true)
                } else { completion(false) }
            case .three:
                if awayThreePM > 0 {
                    awayThreePM -= 1
                    awayquarter -= 3
                    completion(true)
                } else { completion(false) }
            }
        }
    }
    
}
