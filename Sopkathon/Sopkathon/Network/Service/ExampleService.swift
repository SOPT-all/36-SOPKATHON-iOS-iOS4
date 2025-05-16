//
//  ExampleService.swift
//  Sopkathon
//
//  Created by 권석기 on 5/17/25.
//

import Foundation

import Moya

/*
 API를 설정했다면 provider를 생성하고 요청해주면 됩니다.
 
 1. Provider 생성
 
 2. async 혹은 클로저로 입맛에 맞게 사용
 
 3. 리턴값 유무
 
 단순히 요청만 필요한 경우
 ```
 try awwait provider.async.request.requestPlain(API)
 ```
 
 리턴값이 필요한 경우(제네릭)
 ```
 let result: T = try await provier.async.request(API)
 ```
 */

final class ExampleService {        
    
    // Provider에 사용하려는 API를 제네릭으로 넘겨주세요
    private let provider = MoyaProvider<ExampleAPI>()
    
    func exmapleRequest() async throws -> [Post] {
        do {
            let result: [Post] = try await provider.async.request(.exampleRequest)
            return result
        } catch {
            throw APIError.unknownError
        }
    }
}
