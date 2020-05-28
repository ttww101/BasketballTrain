//
//  NewsModel.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/27.
//  Copyright © 2019 Apple. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    let data: [News]
    let success: Bool
}

// MARK: - Datum
struct News: Codable {
    let id: Int
    let matchDate: String
    let status: Int
    let wheelNo: String
    let leagueID: Int
    let leagueName: String
    let homeID: Int
    let homeName: String
    let awayID: Int
    let awayName: String
    let homeScore, awayScore: Int
    let remark: String?
    let attentionID: Int
    let homeLogoURL: String
    let awayLogoURL: String
    let awayScores, homeScores: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case matchDate = "match_date"
        case status
        case wheelNo = "wheel_no"
        case leagueID = "league_id"
        case leagueName = "league_name"
        case homeID = "home_id"
        case homeName = "home_name"
        case awayID = "away_id"
        case awayName = "away_name"
        case homeScore = "home_score"
        case awayScore = "away_score"
        case remark
        case attentionID = "attention_id"
        case homeLogoURL = "home_logo_url"
        case awayLogoURL = "away_logo_url"
        case awayScores = "away_scores"
        case homeScores = "home_scores"
    }
}
