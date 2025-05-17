//
//  MypageResponseModel.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

// 수정될 예정
struct MypageResponseModel: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let data: Member
}

struct Member: Decodable {
    let id: Int
    let username: String
    let telephone: String
    let role: String
}
