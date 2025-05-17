//
//  MypageAPI.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import Foundation

import Moya

enum MypageAPI: TargetType {
    case getMypage(id: Int)
    
    var baseURL: URL {
        // 실제 서버 URL로 변경하기
        return URL(string: "https://api.domain.com")!
    }
    
    var path: String {
        switch self {
        case .getMypage(let id):
            return " /api/members/(memberId)/activities"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMypage:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMypage:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
