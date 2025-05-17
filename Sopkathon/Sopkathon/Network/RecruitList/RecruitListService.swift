//
//  MypageService.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

import Foundation

import Moya

final class RecruitListService {
    private let provider = MoyaProvider<RecruitListAPI>(plugins: [MoyaLoggingPlugin()])
    
    static let shared = RecruitListService()
    private init() {}
    
    func fetchRecruitList(parameters: [String: String], completion: @escaping (Result<RecruitResponseWrapper, Error>) -> Void) {
            provider.request(.getRecruitList(parameters: parameters)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decoded = try JSONDecoder().decode(RecruitResponseWrapper.self, from: response.data)
                        completion(.success(decoded))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
