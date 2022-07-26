//
//  SearchBusinessRes.swift
//  Data
//
//  Created by Khoa Nguyen on 26/07/2022.
//

import Foundation
import Domain

struct SearchBusinessRes: Decodable {

    var total: Int?
    var businesses: [BusinessDTO]?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case businesses = "businesses"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        total = try? container.decode(Int.self, forKey: .total)
        businesses = try? container.decode([BusinessDTO].self, forKey: .businesses)
    }

}

struct BusinessDTO: Decodable {

    var name: String?
    var location: Location?
    var url: String?
    var transactions: [String]?
    var price: String?
    var id: String?
    var displayPhone: String?
    var rating: Double?
    var imageUrl: String?
    var phone: String?
    var reviewCount: Int?
    var categories: [Categories]?
    var coordinates: Coordinates?
    var alias: String?
    var isClosed: Bool = true
    var distance: Double?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case location = "location"
        case url = "url"
        case transactions = "transactions"
        case price = "price"
        case id = "id"
        case displayPhone = "display_phone"
        case rating = "rating"
        case imageUrl = "image_url"
        case phone = "phone"
        case reviewCount = "review_count"
        case categories = "categories"
        case coordinates = "coordinates"
        case alias = "alias"
        case isClosed = "is_closed"
        case distance = "distance"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(String.self, forKey: .name)
        location = try? container.decode(Location.self, forKey: .location)
        url = try? container.decode(String.self, forKey: .url)
        transactions = try? container.decode([String].self, forKey: .transactions)
        price = try? container.decode(String.self, forKey: .price)
        id = try? container.decode(String.self, forKey: .id)
        displayPhone = try? container.decode(String.self, forKey: .displayPhone)
        rating = try? container.decode(Double.self, forKey: .rating)
        imageUrl = try? container.decode(String.self, forKey: .imageUrl)
        phone = try? container.decode(String.self, forKey: .phone)
        reviewCount = try? container.decode(Int.self, forKey: .reviewCount)
        categories = try? container.decode([Categories].self, forKey: .categories)
        coordinates = try? container.decode(Coordinates.self, forKey: .coordinates)
        alias = try? container.decode(String.self, forKey: .alias)
        isClosed = (try? container.decodeIfPresent(Bool.self, forKey: .isClosed)) ?? true
        distance = try? container.decode(Double.self, forKey: .distance)
    }

}

extension BusinessDTO {
    var asDomain: BussinessEnity {
        BussinessEnity(name: name ?? "",
                       photo: imageUrl ?? "",
                       categories: categories?.compactMap({ $0.title }) ?? [],
                       addresses: location?.displayAddress ?? [],
                       phone: displayPhone ?? "",
                       ratings: rating ?? 0,
                       isOpen: !isClosed,
                       distance: distance ?? 0)
    }
}
