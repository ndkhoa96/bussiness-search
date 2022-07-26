//
//  Category.swift
//  Data
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Foundation

struct Categories: Decodable {

    var alias: String?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case alias = "alias"
        case title = "title"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        alias = try? container.decode(String.self, forKey: .alias)
        title = try? container.decode(String.self, forKey: .title)
    }

}
