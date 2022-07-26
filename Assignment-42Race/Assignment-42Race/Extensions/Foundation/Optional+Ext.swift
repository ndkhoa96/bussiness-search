//
//  Optional+Ext.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import Foundation

public extension Optional where Wrapped == String {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return String(describing: value)
        default:
            return ""
        }
    }
}
