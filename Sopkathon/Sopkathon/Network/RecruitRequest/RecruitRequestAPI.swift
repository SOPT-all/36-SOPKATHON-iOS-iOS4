//
//  RecruitAPI.swift
//  Sopkathon
//
//  Created by 권석기 on 5/18/25.
//

import Foundation

import Moya

enum RecruitRequestAPI: TargetType {
    
    // 요청 케이스
    case requstRecruit(postId: String)
        
    var baseURL: URL {
        return URL(string: "http://52.79.208.129.nip.io")!
    }
        
    var path: String {
        switch self {
        case let .requstRecruit(postId):
            return "/api/activity-posts/\(postId)/apply"
        }
    }
        
    var method: Moya.Method {
        switch self {
        case .requstRecruit:
            return .post
        }
    }
        
    var task: Moya.Task {
        switch self {
        case .requstRecruit:
            return .requestParameters(parameters: ["memberId": "2"], encoding: URLEncoding.queryString)
        }
    }
        
    var headers: [String : String]? {
        switch self {
        case .requstRecruit:
            return ["Content-type": "application/json",
                    "Authorization": "Bearer "]
        default:
            return ["Content-type": "application/json"]
        }
    }
}


