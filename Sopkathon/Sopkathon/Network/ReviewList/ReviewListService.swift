//
//  ReviewListService.swift
//  Sopkathon
//
//  Created by 이나연 on 5/18/25.
//

import Foundation

import Moya

final class ReviewListService {
    private let provider = MoyaProvider<ReviewListAPI>(plugins: [MoyaLoggingPlugin()])
    
    func reviewRequest(postId: String) async throws -> [ReviewListModel] {
        do {
            let result: ReviewListWrapper = try await provider.async.request(.reviewRequest(postId: postId))
            return result.data
        } catch {
            throw APIError.unknownError
        }
    }
}
