//
//  ExampleAPI.swift
//  Sopkathon
//
//  Created by 권석기 on 5/17/25.
//

import Foundation

import Moya

/*
 Moya로 통신하기 위한 example 입니다.
 다른 어려운말은 저도모르고 하지않고 우선 빠르게 통신하는법 위주로 설명합니다.
 
 1. TargetType 프로토콜을 채택한 열거형 생성(보통 네이밍은 {Feaature}API로 네이밍 합니다.)
 
 2. 요구하는 속성들을 설정해줍니다.
 
 3. 모두 설정했다면 Provider를 설정하러 ExampleService 폴더로 이동해주세요
 */

enum ExampleAPI: TargetType {
    
    // 요청 케이스
    case exampleRequest
    
    // 기본 URL
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    // URL에 추가될 path
    var path: String {
        switch self {
        case .exampleRequest:
            return "/posts"
        }
    }
    
    // Http Method(.get, .post, .put, .delete)
    var method: Moya.Method {
        switch self {
        case .exampleRequest:
            return .get
        }
    }
    
    // body에 담아서 보내야 하는경우 이곳에서 처리합니다
    var task: Moya.Task {
        switch self {
            // 아무것도 보낼것이 없을때
        case .exampleRequest:
            return .requestPlain
            // 만약 쿼리파라미터로 date=20240517 보내고싶다면
        case .exampleRequest:
            return .requestParameters(parameters: ["date": "20240517"], encoding: URLEncoding.queryString)
            // body에 담아서 보내고 싶을때
            // 📌 body에 담아서 보내려는 모델은 Codable or Encodable을 채택해야 합니다.
        case let .exampleRequest:
            let exampleModel = ExampleModel()
            return .requestJSONEncodable(exampleModel)
        }
    }
    
    // header에 담아서 보낼값을 지정할 수 있습니다
    var headers: [String : String]? {
        switch self {
        case .exampleRequest:
            return ["Content-type": "application/json",
                    "Authorization": "Bearer "]
        default:
            return ["Content-type": "application/json"]
        }
    }
}


