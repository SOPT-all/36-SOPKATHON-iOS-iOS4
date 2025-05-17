//
//  ReviewListAPI.swift
//  Sopkathon
//
//  Created by 이세민 on 5/17/25.
//

import Foundation

import Moya

enum ReviewListAPI: TargetType {
    case reviewRequest(postId: String)
    
    var baseURL: URL {
        return URL(string: "http://52.79.208.129.nip.io")!
    }
    
    var path: String {
        switch self {
        case let .reviewRequest(postId):
            return "/api/activity-posts/\(postId)/reviews"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .reviewRequest:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .reviewRequest:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .reviewRequest:
            return ["Content-type": "application/json"]
        }
    }
}
