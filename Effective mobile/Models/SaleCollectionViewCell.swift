//
//  SaleCollectionViewCell.swift
//  Effective mobile
//
//  Created by Denis Klimov on 21.03.2023.
//

import UIKit

class SaleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var discountLabel: RoundedLabel!
    @IBOutlet weak var categoryLabel: RoundedLabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
}
