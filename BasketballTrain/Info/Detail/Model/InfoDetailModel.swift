//
//  InfoDetailModel.swift
//  BasketballTrain
//
//  Created by Apple on 2019/12/2.
//  Copyright © 2019 Apple. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let infoDetailModel = try? newJSONDecoder().decode(InfoDetailModel.self, from: jsonData)

import Foundation

// MARK: - InfoDetailModel
struct InfoDetailModel: Codable {
    let code, message: String
    let data: InfoDetail
}

// MARK: - InfoDetail
struct InfoDetail: Codable {
    let id, cateID: Int
    let title: String
    let thumb: String
    let author, resource, dataDescription, publishAt: String
    let createdAt, cateName, content: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case cateID = "cate_id"
        case title, thumb, author, resource
        case dataDescription = "description"
        case publishAt = "publish_at"
        case createdAt = "created_at"
        case cateName = "cate_name"
        case content
    }
}

