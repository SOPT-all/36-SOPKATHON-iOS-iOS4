//
//  RecruitRequestService.swift
//  Sopkathon
//
//  Created by 권석기 on 5/18/25.
//

import UIKit

import Moya

final class RecruitRequestService {
    static let shared = RecruitRequestService()
    private init() {}
    private let provier = MoyaProvider<RecruitRequestAPI>(plugins: [MoyaLoggingPlugin()])
    func requestRecruit(postId: String) async throws -> Bool {
        do {
            let result: RecruitDetailResponseWrapper = try await provier.async.request(.requstRecruit(postId: postId))
            return result.success
        } catch {
            throw error
        }
    }
}
