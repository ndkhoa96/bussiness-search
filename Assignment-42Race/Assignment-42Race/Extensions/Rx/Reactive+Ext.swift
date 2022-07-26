//
//  Reactive+Ext.swift
//  App
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import RxSwift
import UIKit

extension Reactive where Base: UIViewController {
    var isLoading: Binder<Bool> { Binder(base) { $1 ? $0.showIndicator() : $0.hideIndicator() }}
    var error: Binder<(Error)> {
        Binder(base) { (base: Base, payload: Error) in
            base.handle(error: payload)
        }
    }
}
