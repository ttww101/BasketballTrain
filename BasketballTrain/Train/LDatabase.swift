//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "crossover01", durationLbl: 5, videoTitle: "运球基础技巧", videoDescription: "练就像Kyrie Irving般的运球", intensity: "入门", videoID: "2dQ9l7VF1ZQ", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 71, stopTime: 9, restTime: 3, timesDescription: 30, actionDescription: "原地运球"),
            TrainActionModel(youtubeTime: 108, stopTime: 14, restTime: 3, timesDescription: 30, actionDescription: "换手运球"),
            TrainActionModel(youtubeTime: 155, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "胯下运球"),
            TrainActionModel(youtubeTime: 211, stopTime: 17, restTime: 3, timesDescription: 60, actionDescription: "背后运球"),
            TrainActionModel(youtubeTime: 280, stopTime: 13, restTime: 3, timesDescription: 60, actionDescription: "转身运球1"),
            TrainActionModel(youtubeTime: 298, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "转身运球2")
            ]),
        TrainListModel(videoImg: "crossover02", durationLbl: 4, videoTitle: "运球技巧", videoDescription: "林书豪篮球教练", intensity: "入门", videoID: "Bk9lkG_kx0o", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 84, stopTime: 31, restTime: 3, timesDescription: 60, actionDescription: "基础运球"),
            TrainActionModel(youtubeTime: 134, stopTime: 16, restTime: 3, timesDescription: 30, actionDescription: "基础站姿"),
            TrainActionModel(youtubeTime: 174, stopTime: 7, restTime: 3, timesDescription: 30, actionDescription: "护球手"),
            TrainActionModel(youtubeTime: 240, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "基本变向"),
            TrainActionModel(youtubeTime: 267, stopTime: 25, restTime: 3, timesDescription: 30, actionDescription: "胯下运球"),
            TrainActionModel(youtubeTime: 294, stopTime: 11, restTime: 3, timesDescription: 30, actionDescription: "背后运球")
            ]),
        TrainListModel(videoImg: "crossover03", durationLbl: 7, videoTitle: "篮球教学", videoDescription: "5种酷炫且实用的crossover", intensity: "中等", videoID: "uU4-mqzFCAg", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 111, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "实用运球1"),
            TrainActionModel(youtubeTime: 178, stopTime: 45, restTime: 3, timesDescription: 90, actionDescription: "实用运球2"),
            TrainActionModel(youtubeTime: 258, stopTime: 43, restTime: 3, timesDescription: 90, actionDescription: "实用运球3"),
            TrainActionModel(youtubeTime: 392, stopTime: 62, restTime: 3, timesDescription: 120, actionDescription: "实用运球4"),
            TrainActionModel(youtubeTime: 509, stopTime: 37, restTime: 3, timesDescription: 60, actionDescription: "实用运球5")
            ]),
        TrainListModel(videoImg: "crossover04", durationLbl: 7, videoTitle: "篮球教学", videoDescription: "5种酷炫且实用的crossover", intensity: "中等", videoID: "uU4-mqzFCAg", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 111, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "实用运球1"),
            TrainActionModel(youtubeTime: 178, stopTime: 45, restTime: 3, timesDescription: 90, actionDescription: "实用运球2"),
            TrainActionModel(youtubeTime: 258, stopTime: 43, restTime: 3, timesDescription: 90, actionDescription: "实用运球3"),
            TrainActionModel(youtubeTime: 392, stopTime: 62, restTime: 3, timesDescription: 120, actionDescription: "实用运球4"),
            TrainActionModel(youtubeTime: 509, stopTime: 37, restTime: 3, timesDescription: 60, actionDescription: "实用运球5")
            ]),
        TrainListModel(videoImg: "layup01", durationLbl: 1, videoTitle: "教你三种篮下终结的方法", videoDescription: "真的会上篮吗?", intensity: "入门", videoID: "XLyhtO5ppWk", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 305, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "高手上篮"),
            TrainActionModel(youtubeTime: 312, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "低手上篮"),
            TrainActionModel(youtubeTime: 318, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "勾手上篮")
            ]),
        TrainListModel(videoImg: "layup02", durationLbl: 3, videoTitle: "上篮步法教学", videoDescription: "跑篮王子速成班", intensity: "入门", videoID: "we2Ypq6Wjwg", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 42, stopTime: 10, restTime: 3, timesDescription: 30, actionDescription: "基本上篮1"),
            TrainActionModel(youtubeTime: 105, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮2"),
            TrainActionModel(youtubeTime: 155, stopTime: 8, restTime: 3, timesDescription: 30, actionDescription: "基本上篮3"),
            TrainActionModel(youtubeTime: 183, stopTime: 6, restTime: 3, timesDescription: 30, actionDescription: "基本上篮4"),
            TrainActionModel(youtubeTime: 210, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮5"),
            TrainActionModel(youtubeTime: 260, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮6")
            ]),
        TrainListModel(videoImg: "layup03", durationLbl: 1, videoTitle: "三步上篮", videoDescription: "篮球教学", intensity: "入门", videoID: "thIYbn9rP1Q", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 7, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "三步上篮")
            ]),
        TrainListModel(videoImg: "layup04", durationLbl: 2, videoTitle: "对抗性上篮全方位练习", videoDescription: "NBA教学 实战实用", intensity: "入门", videoID: "zDprMBDoTT4", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 137, stopTime: 5, restTime: 3, timesDescription: 30, actionDescription: "主动接触"),
            TrainActionModel(youtubeTime: 181, stopTime: 18, restTime: 3, timesDescription: 30, actionDescription: "受干扰单手上篮"),
            TrainActionModel(youtubeTime: 236, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "护球侧身上篮")
            ]),
        TrainListModel(videoImg: "shooting01", durationLbl: 3, videoTitle: "三招让你的投篮更加完美", videoDescription: "投篮不稳定？", intensity: "入门", videoID: "YjrJEZpVj_0", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 90, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "定点投篮练习"),
            TrainActionModel(youtubeTime: 170, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "侧边投篮练习"),
            TrainActionModel(youtubeTime: 198, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "斜边投篮练习")
            ]),
        TrainListModel(videoImg: "shooting02", durationLbl: 3, videoTitle: "轻松提高投篮命中率", videoDescription: "投篮训练", intensity: "入门", videoID: "Ymff29xtljM", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 323, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "投篮训练1"),
            TrainActionModel(youtubeTime: 386, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "投篮训练2"),
            TrainActionModel(youtubeTime: 470, stopTime: 17, restTime: 3, timesDescription: 60, actionDescription: "投篮训练3")
            ]),
        TrainListModel(videoImg: "shooting03", durationLbl: 3, videoTitle: "投篮技巧教学", videoDescription: "成为神射手的必经之路", intensity: "入门", videoID: "SV95ZohrCLo", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 63, stopTime: 10, restTime: 3, timesDescription: 60, actionDescription: "原地投篮"),
            TrainActionModel(youtubeTime: 120, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "接球跳投"),
            TrainActionModel(youtubeTime: 172, stopTime: 14, restTime: 3, timesDescription: 60, actionDescription: "接球垫步")
            ])
    ]
    
    private let crossoverArray = [
        TrainListModel(videoImg: "crossover01", durationLbl: 5, videoTitle: "运球基础技巧", videoDescription: "练就像Kyrie Irving般的运球", intensity: "入门", videoID: "2dQ9l7VF1ZQ", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 71, stopTime: 9, restTime: 3, timesDescription: 30, actionDescription: "原地运球"),
            TrainActionModel(youtubeTime: 108, stopTime: 14, restTime: 3, timesDescription: 30, actionDescription: "换手运球"),
            TrainActionModel(youtubeTime: 155, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "胯下运球"),
            TrainActionModel(youtubeTime: 211, stopTime: 17, restTime: 3, timesDescription: 60, actionDescription: "背后运球"),
            TrainActionModel(youtubeTime: 280, stopTime: 13, restTime: 3, timesDescription: 60, actionDescription: "转身运球1"),
            TrainActionModel(youtubeTime: 298, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "转身运球2")
            ]),
        TrainListModel(videoImg: "crossover02", durationLbl: 4, videoTitle: "运球技巧", videoDescription: "林书豪篮球教练", intensity: "入门", videoID: "Bk9lkG_kx0o", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 84, stopTime: 31, restTime: 3, timesDescription: 60, actionDescription: "基础运球"),
            TrainActionModel(youtubeTime: 134, stopTime: 16, restTime: 3, timesDescription: 30, actionDescription: "基础站姿"),
            TrainActionModel(youtubeTime: 174, stopTime: 7, restTime: 3, timesDescription: 30, actionDescription: "护球手"),
            TrainActionModel(youtubeTime: 240, stopTime: 21, restTime: 3, timesDescription: 60, actionDescription: "基本变向"),
            TrainActionModel(youtubeTime: 267, stopTime: 25, restTime: 3, timesDescription: 30, actionDescription: "胯下运球"),
            TrainActionModel(youtubeTime: 294, stopTime: 11, restTime: 3, timesDescription: 30, actionDescription: "背后运球")
            ]),
        TrainListModel(videoImg: "crossover03", durationLbl: 3, videoTitle: "五种超实用进攻动作", videoDescription: "拒绝花哨运球", intensity: "中等", videoID: "rOMS2Fsc9OI", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 113, stopTime: 12, restTime: 3, timesDescription: 30, actionDescription: "剪刀脚"),
            TrainActionModel(youtubeTime: 223, stopTime: 13, restTime: 3, timesDescription: 30, actionDescription: "底线转身"),
            TrainActionModel(youtubeTime: 258, stopTime: 26, restTime: 3, timesDescription: 30, actionDescription: "弧顶转身"),
            TrainActionModel(youtubeTime: 318, stopTime: 52, restTime: 3, timesDescription: 60, actionDescription: "禁区小拜佛"),
            TrainActionModel(youtubeTime: 376, stopTime: 9, restTime: 3, timesDescription: 30, actionDescription: "犹豫步")
            ]),
        TrainListModel(videoImg: "crossover04", durationLbl: 7, videoTitle: "篮球教学", videoDescription: "5种酷炫且实用的crossover", intensity: "中等", videoID: "uU4-mqzFCAg", category: .crossover, actionModel: [
            TrainActionModel(youtubeTime: 111, stopTime: 28, restTime: 3, timesDescription: 60, actionDescription: "实用运球1"),
            TrainActionModel(youtubeTime: 178, stopTime: 45, restTime: 3, timesDescription: 90, actionDescription: "实用运球2"),
            TrainActionModel(youtubeTime: 258, stopTime: 43, restTime: 3, timesDescription: 90, actionDescription: "实用运球3"),
            TrainActionModel(youtubeTime: 392, stopTime: 62, restTime: 3, timesDescription: 120, actionDescription: "实用运球4"),
            TrainActionModel(youtubeTime: 509, stopTime: 37, restTime: 3, timesDescription: 60, actionDescription: "实用运球5")
            ])
    ]
    
    private let layupArray = [
        TrainListModel(videoImg: "layup01", durationLbl: 1, videoTitle: "教你三种篮下终结的方法", videoDescription: "真的会上篮吗?", intensity: "入门", videoID: "XLyhtO5ppWk", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 305, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "高手上篮"),
            TrainActionModel(youtubeTime: 312, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "低手上篮"),
            TrainActionModel(youtubeTime: 318, stopTime: 5, restTime: 3, timesDescription: 20, actionDescription: "勾手上篮")
            ]),
        TrainListModel(videoImg: "layup02", durationLbl: 3, videoTitle: "上篮步法教学", videoDescription: "跑篮王子速成班", intensity: "入门", videoID: "we2Ypq6Wjwg", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 42, stopTime: 10, restTime: 3, timesDescription: 30, actionDescription: "基本上篮1"),
            TrainActionModel(youtubeTime: 105, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮2"),
            TrainActionModel(youtubeTime: 155, stopTime: 8, restTime: 3, timesDescription: 30, actionDescription: "基本上篮3"),
            TrainActionModel(youtubeTime: 183, stopTime: 6, restTime: 3, timesDescription: 30, actionDescription: "基本上篮4"),
            TrainActionModel(youtubeTime: 210, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮5"),
            TrainActionModel(youtubeTime: 260, stopTime: 15, restTime: 3, timesDescription: 30, actionDescription: "基本上篮6")
            ]),
        TrainListModel(videoImg: "layup03", durationLbl: 1, videoTitle: "三步上篮", videoDescription: "篮球教学", intensity: "入门", videoID: "thIYbn9rP1Q", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 7, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "三步上篮")
            ]),
        TrainListModel(videoImg: "layup04", durationLbl: 2, videoTitle: "对抗性上篮全方位练习", videoDescription: "NBA教学 实战实用", intensity: "入门", videoID: "zDprMBDoTT4", category: .layup, actionModel: [
            TrainActionModel(youtubeTime: 137, stopTime: 5, restTime: 3, timesDescription: 30, actionDescription: "主动接触"),
            TrainActionModel(youtubeTime: 181, stopTime: 18, restTime: 3, timesDescription: 30, actionDescription: "受干扰单手上篮"),
            TrainActionModel(youtubeTime: 236, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "护球侧身上篮")
            ])
    ]
    
    private let shootingArray = [
        TrainListModel(videoImg: "shooting01", durationLbl: 3, videoTitle: "三招让你的投篮更加完美", videoDescription: "投篮不稳定？", intensity: "入门", videoID: "YjrJEZpVj_0", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 90, stopTime: 15, restTime: 3, timesDescription: 60, actionDescription: "定点投篮练习"),
            TrainActionModel(youtubeTime: 170, stopTime: 12, restTime: 3, timesDescription: 60, actionDescription: "侧边投篮练习"),
            TrainActionModel(youtubeTime: 198, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "斜边投篮练习")
            ]),
        TrainListModel(videoImg: "shooting02", durationLbl: 3, videoTitle: "轻松提高投篮命中率", videoDescription: "投篮训练", intensity: "入门", videoID: "Ymff29xtljM", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 323, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "投篮训练1"),
            TrainActionModel(youtubeTime: 386, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "投篮训练2"),
            TrainActionModel(youtubeTime: 470, stopTime: 17, restTime: 3, timesDescription: 60, actionDescription: "投篮训练3")
            ]),
        TrainListModel(videoImg: "shooting03", durationLbl: 3, videoTitle: "投篮技巧教学", videoDescription: "成为神射手的必经之路", intensity: "入门", videoID: "SV95ZohrCLo", category: .shooting, actionModel: [
            TrainActionModel(youtubeTime: 63, stopTime: 10, restTime: 3, timesDescription: 60, actionDescription: "原地投篮"),
            TrainActionModel(youtubeTime: 120, stopTime: 20, restTime: 3, timesDescription: 60, actionDescription: "接球跳投"),
            TrainActionModel(youtubeTime: 172, stopTime: 14, restTime: 3, timesDescription: 60, actionDescription: "接球垫步")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return crossoverArray
        case 2:
            return layupArray
        case 3:
            return shootingArray
        default:
            return allArray
        }
    }
}
