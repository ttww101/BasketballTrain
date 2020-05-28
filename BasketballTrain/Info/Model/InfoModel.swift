//
//  InfoModel.swift
//  BasketballTrain
//
//  Created by Apple on 2019/11/29.
//  Copyright © 2019 Apple. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let infoModel = try? newJSONDecoder().decode(InfoModel.self, from: jsonData)

import Foundation

// MARK: - InfoModel
struct InfoModel: Codable {
    let code, message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let total, perPage, currentPage, lastPage: Int
    let data: [Info]
    
    enum CodingKeys: String, CodingKey {
        case total
        case perPage = "per_page"
        case currentPage = "current_page"
        case lastPage = "last_page"
        case data
    }
}

// MARK: - Datum
struct Info: Codable {
    let id: Int
    let title, author, resource: String
    let thumb: String
    let cateID: Int
    let publishAt, createdAt, datumDescription: String
    let url: String
    let cateName: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, author, resource, thumb
        case cateID = "cate_id"
        case publishAt = "publish_at"
        case createdAt = "created_at"
        case datumDescription = "description"
        case url
        case cateName = "cate_name"
    }
}

