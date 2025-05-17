//
//  RecruitDetailAPI.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import Foundation

import Moya

enum RecruitDetailAPI: TargetType {
    
    // 요청 케이스
    case fetchRecruitDetail(postId: String)
        
    var baseURL: URL {
        return URL(string: "http://52.79.208.129.nip.io")!
    }
        
    var path: String {
        switch self {
        case let .fetchRecruitDetail(postId):
            return "/api/activity-posts/\(postId)"
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .fetchRecruitDetail:
            return .get
        }
    }
        
    var task: Moya.Task {
        switch self {
        case .fetchRecruitDetail:
            return .requestPlain
        }
    }
        
    var headers: [String : String]? {
        switch self {
        case .fetchRecruitDetail:
            return ["Content-type": "application/json",
                    "Authorization": "Bearer "]
        default:
            return ["Content-type": "application/json"]
        }
    }
}


