//
//  SaleItemModel.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import Foundation

struct SaleItemsModel: Codable {
    var flash_sale: Array<SaleItemModel>
}

struct SaleItemModel: Codable {
    var category: String
    var name: String
    var price: Double
    var discount: Int
    var image_url: String
}
