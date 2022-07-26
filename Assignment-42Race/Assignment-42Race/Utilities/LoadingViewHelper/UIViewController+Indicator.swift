//
//  UIViewController+NVActivityIdicatorView.swift
//  App
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import UIKit

extension UIViewController {
    func showIndicator(in parentView: UIView? = nil,
                       loadingMessage: String = "",
                       allowsUserInteraction: Bool = false) {
        DispatchQueue.main.async {
            LoadingViewHelper.show(in: parentView ?? UIWindow.key ?? self.view,
                                   loadingMessage: loadingMessage,
                                   allowsUserInteraction: allowsUserInteraction)
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            LoadingViewHelper.hide()
        }
    }
}
