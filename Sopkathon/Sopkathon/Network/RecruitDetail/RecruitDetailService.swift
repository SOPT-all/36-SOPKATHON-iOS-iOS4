//
//  RecruitDetailService.swift
//  Sopkathon
//
//  Created by 권석기 on 5/18/25.
//

import UIKit

import Moya

final class RecruitDetailService {
    static let shared = RecruitDetailService()
    private let provier = MoyaProvider<RecruitDetailAPI>(plugins: [MoyaLoggingPlugin()])
    
    func fetchRequrestDetail(postId: String)  async throws -> RecruitDetailResponseModel {
        do {
            let result: RecruitDetailResponseWrapper = try await provier.async.request(.fetchRecruitDetail(postId: postId))
            return result.data
        } catch {
            throw error
        }
    }
}
