//
//  ProGRecordModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ProGRecordModel {
    var team1: teamRecordModel
    var team2: teamRecordModel
    var quarter: Int
    var gameDate: String?
}

struct teamRecordModel {
    var name: String
    var quarter1: Int
    var quarter2: Int
    var quarter3: Int
    var quarter4: Int
    var FTM: Int
    var threePM: Int
    var twoPM: Int
    var score: Int {
        return quarter1 + quarter2 + quarter3 + quarter4
    }
    var quarter: [Int] {
        return [quarter1, quarter2, quarter3, quarter4]
    }
    var detail: [Int] {
        return [FTM, threePM, twoPM]
    }
}
