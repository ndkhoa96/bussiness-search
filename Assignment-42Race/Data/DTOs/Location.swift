//
//  Location.swift
//  Data
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Foundation

struct Location: Decodable {

    var country: String?
    var city: String?
    var address3: String?
    var address1: String?
    var displayAddress: [String]?
    var zipCode: String?
    var address2: String?
    var state: String?

    enum CodingKeys: String, CodingKey {
        case country = "country"
        case city = "city"
        case address3 = "address3"
        case address1 = "address1"
        case displayAddress = "display_address"
        case zipCode = "zip_code"
        case address2 = "address2"
        case state = "state"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try? container.decode(String.self, forKey: .country)
        city = try? container.decode(String.self, forKey: .city)
        address3 = try? container.decode(String.self, forKey: .address3)
        address1 = try? container.decode(String.self, forKey: .address1)
        displayAddress = try? container.decode([String].self, forKey: .displayAddress)
        zipCode = try? container.decode(String.self, forKey: .zipCode)
        address2 = try? container.decode(String.self, forKey: .address2)
        state = try? container.decode(String.self, forKey: .state)
    }

}
