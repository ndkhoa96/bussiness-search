//
//  Coordinate.swift
//  Data
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Foundation

struct Coordinates: Decodable {

    var latitude: Double?
    var longitude: Double?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try? container.decode(Double.self, forKey: .latitude)
        longitude = try? container.decode(Double.self, forKey: .longitude)
    }
  
}
