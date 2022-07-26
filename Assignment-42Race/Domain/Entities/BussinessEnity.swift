//
//  BussinessEnity.swift
//  Domain
//
//  Created by Khoa Nguyen on 25/07/2022.
//

import Foundation

public class BussinessEnity {
    public let name: String
    public let photo: String
    public let categories: [String]
    public let addresses: [String]
    public let phone: String
    public let ratings: Double
    public let isOpen: Bool
    public let distance: Double

    public init(name: String, photo: String, categories: [String], addresses: [String], phone: String, ratings: Double, isOpen: Bool, distance: Double) {
        self.name = name
        self.photo = photo
        self.categories = categories
        self.addresses = addresses
        self.phone = phone
        self.ratings = ratings
        self.isOpen = isOpen
        self.distance = distance
    }
    
}
