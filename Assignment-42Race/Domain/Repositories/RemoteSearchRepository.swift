//
//  RemoteSearchrRepository.swift
//  Domain
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Foundation

public protocol RemoteBusinessSearchRepository {
    func search(name: String, long: Double, late: Double,
                completion: @escaping((Result<[BussinessEnity], Error>) -> Void))
}
