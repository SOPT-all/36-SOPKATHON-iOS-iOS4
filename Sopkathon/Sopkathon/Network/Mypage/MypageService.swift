//
//  MypageService.swift
//  Sopkathon
//
//  Created by 이세민 on 5/18/25.
//

import Foundation
import Moya

final class MypageService {
    
    static let shared = MypageService()
    private let provider = MoyaProvider<MypageAPI>()
    
    private init() {}
    
    func getMypage(id: Int, completion: @escaping (Result<MypageResponseModel, Error>) -> Void) {
        provider.request(.getMypage(id: id)) { result in
            switch result {
            case .success(let response):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let responseModel = try decoder.decode(MypageResponseModel.self, from: response.data)
                    completion(.success(responseModel))
                } catch {
                    print("\(error)")
                    completion(.failure(error))
                }
                
            case .failure(let error):
                print("\(error)")
                completion(.failure(error))
            }
        }
    }
}
