//
//  LatestItemModel.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import Foundation

struct LatestItemsModel: Decodable {
    var latest: Array<LatestItemModel>
}

struct LatestItemModel: Decodable {
    var category: String
    var name: String
    var price: Int
    var image_url: String
}
