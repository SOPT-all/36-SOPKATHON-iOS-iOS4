//
//  MypageResponseModel.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

struct MypageResponseModel: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let data: MypageData
}

struct MypageData: Decodable {
    let applicationCompleteActivities: [Activity]
    let participationCompleteActivities: [Activity]
}

struct Activity: Decodable {
    let activityId: Int
    let title: String
    let region: String
    let startTime: String
    let endTime: String
    let userId: Int
    let telephone: String
    let imageUrl: String?
}
