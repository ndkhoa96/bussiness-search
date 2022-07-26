//
//  UITableViewCell+Ext.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String {
        String(describing: Self.self)
    }
}
