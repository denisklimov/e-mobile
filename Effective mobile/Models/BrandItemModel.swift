//
//  BrandItemModel.swift
//  Effective mobile
//
//  Created by Denis Klimov on 04.04.2023.
//

import Foundation
import UIKit

struct BrandItemsModel {
    var brands = [  BrandItemModel(image: UIImage(named: "nike")!, name: "Nike"),
                    BrandItemModel(image: UIImage(named: "newBalance")! , name: "New Balance"),
                    BrandItemModel(image: UIImage(named: "everlast")!, name: "Everlast"),
                    BrandItemModel(image: UIImage(named: "asics")!, name: "Asics")
                    ]
}

struct BrandItemModel {
    var image: UIImage
    var name: String
}
