//
//  APIClient.swift
//  Data
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import Moya

public class APIClient {
    public static let shared = APIClient()
    
    let provider = MoyaProvider<MultiTarget>()
    
    var baseURL: URL?
    var key = ""
    
    private init() {}
    
    public func set(baseURL: URL, key: String ) {
        self.baseURL = baseURL
        self.key = key
    }
}
