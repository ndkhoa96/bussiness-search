//
//  UIViewController+Ext.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import UIKit

extension UIViewController {
    func handle(error: Error) {
        show(title: "Error", message: error.localizedDescription)
    }
    
    func show(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alertController, animated: true, completion: nil)
    }
}
