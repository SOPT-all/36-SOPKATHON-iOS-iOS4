import Foundation
import UIKit

struct RecruitResponseModel: Codable {
    let id: Int
    let title: String
    let subject: String
    let content: String
    let participationFee: String
    let region: String
    let isFood: Bool
    let startTime: String
    let endTime: String
    let tag: String
    let maxParticipation: Int
    let participantCount: Int
    let imageUrl: String?
}

struct RecruitResponseWrapper: Codable {
    let success: Bool
    let status: Int
    let message: String
    let data: [RecruitResponseModel]
}
