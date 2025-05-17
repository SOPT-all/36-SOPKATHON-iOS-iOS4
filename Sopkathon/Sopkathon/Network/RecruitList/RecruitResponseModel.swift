import Foundation

struct RecruitResponseModel: Codable {
    let memberId: Int
    let title: String
    let content: String
    let startTime: String
    let endTime: String
    let activityRegion: String
    let opener: String
    let participationFee: String
    let maxParticipation: Int
    let isFood: Bool
    let foodContent: String
    let tag: String
}

extension RecruitResponseModel {
    static func dummy() -> [Self] {
        return [
            RecruitResponseModel(memberId: 1, title: "진천 꿀옥수수 수확 도와줄 친구 구합니다!", content: "내용", startTime: "3/30", endTime: "4/3", activityRegion: "제천", opener: "꿀옥수수재배소", participationFee: "10,000", maxParticipation: 10, isFood: true, foodContent: "새참", tag: "농사"),
            RecruitResponseModel(memberId: 1, title: "제목", content: "내용", startTime: "3/30", endTime: "4/3", activityRegion: "제천", opener: "허승준", participationFee: "10,000", maxParticipation: 10, isFood: true, foodContent: "새참", tag: "농사"),
            RecruitResponseModel(memberId: 1, title: "제목", content: "내용", startTime: "3/30", endTime: "4/3", activityRegion: "제천", opener: "허승준", participationFee: "10,000", maxParticipation: 10, isFood: true, foodContent: "새참", tag: "농사"),
            RecruitResponseModel(memberId: 1, title: "제목", content: "내용", startTime: "3/30", endTime: "4/3", activityRegion: "제천", opener: "허승준", participationFee: "10,000", maxParticipation: 10, isFood: true, foodContent: "새참", tag: "농사"),
            RecruitResponseModel(memberId: 1, title: "제목", content: "내용", startTime: "3/30", endTime: "4/3", activityRegion: "제천", opener: "허승준", participationFee: "10,000", maxParticipation: 10, isFood: true, foodContent: "새참", tag: "농사")
        ]
    }
}
