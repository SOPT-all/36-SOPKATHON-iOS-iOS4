//
//  MypageService.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

import Foundation

import Moya

final class MypageService {
    private let provider = MoyaProvider<MypageAPI>()
    
    static let shared = MypageService()
    private init() {}
    
    func fetchMember(id: Int, completion: @escaping (Result<Member, Error>) -> Void) {
        provider.request(.getMypage(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONDecoder().decode(MypageResponseModel.self, from: response.data)
                    if decoded.success {
                        completion(.success(decoded.data))
                    } else {
                        let err = NSError(domain: "MypageService",
                                          code: decoded.status,
                                          userInfo: [NSLocalizedDescriptionKey: decoded.message])
                        completion(.failure(err))
                    }
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
