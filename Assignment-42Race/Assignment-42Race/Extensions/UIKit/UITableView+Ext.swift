//
//  UITableView+Ext.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(nib: T.Type, bundle: Bundle? = nil) {
        let className = nib.reuseIdentifier
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(nib: T.Type, at indexPath: IndexPath) -> T? {
        dequeueReusableCell(withIdentifier: nib.reuseIdentifier, for: indexPath) as? T
    }
}
