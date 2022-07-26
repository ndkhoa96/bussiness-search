//
//  SearchBusinessUsecase.swift
//  Domain
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import RxSwift

public protocol SearchBusinessUsecase {
    func execute(name: String, long: Double, late: Double) -> Single<[BussinessEnity]>
}

public final class SearchBusinessUsecaseImp: SearchBusinessUsecase {
    
    private let remote: RemoteBusinessSearchRepository

    public init(remote: RemoteBusinessSearchRepository) {
        self.remote = remote
    }
    
    public func execute(name: String, long: Double, late: Double) -> Single<[BussinessEnity]> {
        .create { [unowned self] single in
            self.remote.search(name: name, long: long, late: late) { result in
                switch result {
                case .success(let contacts):
                    single(.success(contacts))
                case .failure(let err):
                    single(.failure(err))
                }
            }
            return Disposables.create()
        }
    }

}
