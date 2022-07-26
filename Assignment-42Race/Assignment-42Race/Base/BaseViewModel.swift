//
//  BaseViewModel.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import RxSwift

class BaseViewModel {
    let disposeBag = DisposeBag()

    let loadingIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
}
