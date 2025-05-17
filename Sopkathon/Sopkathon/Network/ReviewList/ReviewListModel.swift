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
    let userId: Int
    let starRating: Int
    let date: String
//    let activityImg: UIImage
    let content: String
}

extension ReviewListModel {
    static func dummy() -> [ReviewListModel] {
        return[
            ReviewListModel(userId: 1, starRating: 5, date: "5월 18일", content: "후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기"),
            ReviewListModel(userId: 1, starRating: 5, date: "5월 18일", content: "후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기"),
            ReviewListModel(userId: 1, starRating: 5, date: "5월 18일", content: "후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기"),
            ReviewListModel(userId: 1, starRating: 5, date: "5월 18일",content: "후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기후기")
        ]
    }
}
