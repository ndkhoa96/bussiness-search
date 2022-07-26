//
//  RemoteBusinessSearchRepositoryImp.swift
//  Data
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Domain
import Moya

public class RemoteBusinessSearchRepositoryImp: RemoteBusinessSearchRepository {

    public init() { }
    
    public func search(name: String, long: Double, late: Double, completion: @escaping ((Result<[BussinessEnity], Error>) -> Void)) {
        let target = MultiTarget(APIs.search(name: name, latitude: late, longitude: long))
        APIClient.shared.provider.request(target) { result in
            switch result {
            case .success(let response):
                if let searchBusinessRes = try? JSONDecoder().decode(SearchBusinessRes.self, from: response.data),
                let businesses = searchBusinessRes.businesses {
                    completion(.success(businesses.map(\.asDomain)))
                } else {
                    let err = NSError(domain: "Can't parse object", code: 0, userInfo: nil)
                    completion(.failure(err))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
  
}
