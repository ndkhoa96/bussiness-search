//
//  ObservableType+Ext.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import RxSwift
import RxCocoa

extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        asDriver { _ in .empty() }
    }
}
