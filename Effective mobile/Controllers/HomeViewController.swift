//
//  HomeViewController.swift
//  Effective mobile
//
//  Created by Denis Klimov on 19.03.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var latestData: LatestItemsModel?
    var saleData: SaleItemsModel?
    
    let networkManager = NetworkManager()
    let latestItemsURL = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    let saleItemsURL = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    
    @IBOutlet weak var dataView: UIView!
    @IBOutlet weak var searchTextField: SearchTextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var latestCollectionView: UICollectionView!
    @IBOutlet weak var saleCollectionView: UICollectionView!
    @IBOutlet weak var brandsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataView.isHidden = true
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        latestCollectionView.tag = 0
        saleCollectionView.tag = 1
        brandsCollectionView.tag = 2
        
        networkManager.getData(from: latestItemsURL) { result in
            switch result {
                case .failure(let error):
                    self.alertError(error: error.localizedDescription)
                case .success(let data):
                do {
                    let latestItems = try JSONDecoder().decode(LatestItemsModel.self, from: data)
                    self.latestData = latestItems
                    self.didReceivedAllData()
                } catch let error {
                    self.alertError(error: error.localizedDescription)
                }
            }
        }
        
        networkManager.getData(from: saleItemsURL) { result in
            switch result {
                case .failure(let error):
                    self.alertError(error: error.localizedDescription)
                case .success(let data):
                do {
                    let saleItems = try JSONDecoder().decode(SaleItemsModel.self, from: data)
                    self.saleData = saleItems
                    self.didReceivedAllData()
                } catch let error {
                    self.alertError(error: error.localizedDescription)
                }
            }
        }
    }
    
    func didReceivedAllData() {
        if latestData != nil && saleData != nil {
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.latestCollectionView.reloadData()
                self.saleCollectionView.reloadData()
                self.brandsCollectionView.reloadData()
                self.dataView.isHidden = false
            }
        }
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView.tag {
            case 0: return latestData?.latest.count ?? 0
            case 1: return saleData?.flash_sale.count ?? 0
            case 2: return BrandItemsModel().brands.count
            default: return 0
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let corenerRadius: CGFloat = 10
        
        switch collectionView.tag {
        
        case 0:
            let latestCell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCollectionViewCell
            latestCell.layer.cornerRadius = corenerRadius
            
            let imageUrlString = latestData?.latest[indexPath.row].image_url
            networkManager.getImageFrom(url: imageUrlString!) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        latestCell.backgroundImage.image = image
                        latestCell.categoryLabel.text = self.latestData?.latest[indexPath.row].category
                        latestCell.nameLabel.text = self.latestData?.latest[indexPath.row].name
                        latestCell.priceLabel.text = "$ \(self.latestData?.latest[indexPath.row].price.description ?? "")"
                    }
                case .failure(let error):
                    self.alertError(error: error.localizedDescription)
                }
            }
            return latestCell
        
        case 1:
            let saleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "saleCell", for: indexPath) as! SaleCollectionViewCell
            saleCell.layer.cornerRadius = corenerRadius
            
            let imageUrlString = saleData?.flash_sale[indexPath.row].image_url
            networkManager.getImageFrom(url: imageUrlString!) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        saleCell.backgroundImage.image = image
                        saleCell.discountLabel.text = "\(self.saleData?.flash_sale[indexPath.row].discount.description ?? "")% OFF"
                        saleCell.categoryLabel.text = self.saleData?.flash_sale[indexPath.row].category
                        saleCell.nameLabel.text = self.saleData?.flash_sale[indexPath.row].name
                        saleCell.priceLabel.text = "$ \(self.saleData?.flash_sale[indexPath.row].price.description ?? "")"
                    }
                case .failure(let error):
                    self.alertError(error: error.localizedDescription)
                }
            }
            return saleCell
        case 2:
            let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! BrandsCollectionViewCell
            brandCell.layer.cornerRadius = corenerRadius
            brandCell.brandImage.image = BrandItemsModel().brands[indexPath.row].image
            brandCell.brandName.text = BrandItemsModel().brands[indexPath.row].name
            return brandCell
            
        default:
            return UICollectionViewCell()
        }
    }
}
