//
//  SaleItemModel.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import Foundation

struct SaleItemsModel: Decodable {
    var flash_sale: Array<SaleItemModel>
}

struct SaleItemModel: Decodable {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: String
}
