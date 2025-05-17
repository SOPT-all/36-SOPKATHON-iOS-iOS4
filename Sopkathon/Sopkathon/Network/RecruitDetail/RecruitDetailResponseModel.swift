//
//  RecruitDetailResponseModel.swift
//  Sopkathon
//
//  Created by 권석기 on 5/18/25.
//

import Foundation

struct RecruitDetailResponseWrapper: Codable {
    let success: Bool
    let status: Int
    let message: String
    let data: RecruitDetailResponseModel
}

struct RecruitDetailResponseModel: Codable {
    let title: String
    let content: String
    let subject: String
    let participationFee: String
    let startTime: String
    let endTime: String
    let tag: String
    let imageUrl: String?
}

