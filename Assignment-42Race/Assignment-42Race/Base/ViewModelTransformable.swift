//
//  ViewModelTransformable.swift
//  Assignment-42Race
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import Foundation

protocol ViewModelTransformable: AnyObject {
    associatedtype Input
    associatedtype Output
    func transform(input: Input) -> Output
}

