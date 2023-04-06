//
//  CustomTabBar.swift
//  Effective mobile
//
//  Created by Denis Klimov on 04.04.2023.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

     override func viewDidLoad() {
         super.viewDidLoad()
         delegate = self
         tabBar.insertSubview(backgroundCircle(for: 0), at: 0)
         tabBar.tintColor = UIColor(red: 0.45, green: 0.45, blue: 0.59, alpha: 1.00)
     }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        tabBar.subviews[1].removeFromSuperview()
        tabBar.insertSubview(backgroundCircle(for: tabBar.selectedItem!.tag), at: 0)
    }
    
    func backgroundCircle(for index: Int) -> UIView {
        
        let tabBarWidth = tabBar.frame.width
        let tabBarItemFullWidth = tabBarWidth / CGFloat(tabBar.items!.count)
        let tabBarItemHeight = 39.0
        let tabBarItemWidth = tabBarItemHeight
        let xOffset = (tabBarItemFullWidth / 2 - tabBarItemWidth / 2) + (tabBarItemFullWidth * CGFloat(index))
        let yOffset = 6.0
        
        let roundView = UIView(frame: CGRect(x: xOffset, y: yOffset, width: tabBarItemWidth, height: tabBarItemHeight))
        roundView.backgroundColor = UIColor(red: 0.93, green: 0.94, blue: 0.96, alpha: 1.0)
        roundView.layer.cornerRadius = roundView.frame.height / 2
        roundView.removeFromSuperview()
       return roundView
        
    }
}

class CustomTabBar: UITabBar, UITabBarDelegate {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        isTranslucent = true
        backgroundColor = .white
        selectedItem?.image?.withTintColor(UIColor(red: 0.45, green: 0.45, blue: 0.59, alpha: 1.00))
    }
}

class CustomTabBarItem: UITabBarItem {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        
    }
}
