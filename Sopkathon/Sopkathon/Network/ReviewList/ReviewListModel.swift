//
//  ReviewListModel.swift
//  Sopkathon
//
//  Created by 이나연 on 5/18/25.
//

import Foundation

struct ReviewListWrapper: Codable {
    let success: Bool
    let status: Int
    let message: String
    let data: [ReviewListModel]
}
struct ReviewListModel: Codable {
    let memberId: Int
    let star: Int
    let createDate: String
    let activityImageUrl: String?
    let content: String?
}
