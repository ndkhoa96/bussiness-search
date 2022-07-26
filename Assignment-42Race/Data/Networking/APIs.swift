//
//  APIs.swift
//  Data
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import Moya

enum APIs {
    case search(name: String, latitude: Double, longitude: Double)
}

extension APIs: TargetType {
    var method: Moya.Method { .get }
    
    var headers: [String : String]? {
        return ["Authorization": "Bearer " + APIClient.shared.key]
    }
    
    var baseURL: URL {
        guard let baseURL = APIClient.shared.baseURL else {
            fatalError("Invalid server URL")
        }
        return baseURL  
    }
    
    var path: String {
        switch self {
        case .search: return "/businesses/search"
        }
    }
    
    var task: Task {
        switch self {
        case let .search(name,latitude,longitude):
            return .requestParameters(
                parameters: [ "latitude": latitude, "longitude": longitude, "name": name],
                encoding: URLEncoding.queryString)
        }
    }
}
