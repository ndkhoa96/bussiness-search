//
//  DependencyInjection.swift
//  App
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Domain
import Data
import Swinject

let container = Container()

final class DependencyInjection {
    
    static func registerAll() {
        
        // product
        container.register(RemoteBusinessSearchRepository.self) { _ in RemoteBusinessSearchRepositoryImp() }
        container.register(SearchBusinessUsecase.self) { r in
            SearchBusinessUsecaseImp(remote: r.resolve(RemoteBusinessSearchRepository.self)!)
        }
        container.register(BusinessSearchVM.self) { r in
            BusinessSearchVM(searchBusinessUsecase: r.resolve(SearchBusinessUsecase.self)!)
        }
        container.register(BusinessSearchViewController.self) { r in
            BusinessSearchViewController(
                viewModel: r.resolve(BusinessSearchVM.self)!
            )
        }
        
      
    }
}
