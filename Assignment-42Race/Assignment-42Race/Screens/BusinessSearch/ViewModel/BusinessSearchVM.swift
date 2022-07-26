//
//  BusinessSearchVM.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import RxSwift
import RxCocoa
import Domain

class BusinessSearchVM: BaseViewModel, ViewModelTransformable {
    
    struct Input {
        let onSearchTrigger: Observable<String>
    }
    
    struct Output {
        let businesses: Driver<[BussinessEnity]>
        let loadingIndicator: ActivityIndicator
        let errorTracker: ErrorTracker
    }
    
    private let searchBusinessUsecase: SearchBusinessUsecase

    init(searchBusinessUsecase: SearchBusinessUsecase) {
        self.searchBusinessUsecase = searchBusinessUsecase
    }
    
    func transform(input: Input) -> Output {
        let businesses = input.onSearchTrigger
            .withUnretained(self)
            .flatMapLatest({ vm, queryStr in
                vm.searchBusinessUsecase.execute(name: queryStr,
                                                   long: -122.399972,
                                                   late: 37.786882)
                .trackActivity(vm.loadingIndicator)
//                .trackError(vm.errorTracker)
                .asDriverOnErrorJustComplete()
            })
            .asDriverOnErrorJustComplete()

        return Output(businesses: businesses,
                      loadingIndicator: loadingIndicator,
                      errorTracker: errorTracker)
    }
    
}
