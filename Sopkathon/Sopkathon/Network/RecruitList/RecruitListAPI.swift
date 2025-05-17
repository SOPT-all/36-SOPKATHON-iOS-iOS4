import Foundation
import Moya

enum RecruitListAPI: TargetType {
    case getRecruitList(parameters: [String: String])
    
    var baseURL: URL {
        return URL(string: "http://52.79.208.129.nip.io")!
    }
    
    var path: String {
        switch self {
        case .getRecruitList:
            return "/api/activity-posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRecruitList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRecruitList(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
