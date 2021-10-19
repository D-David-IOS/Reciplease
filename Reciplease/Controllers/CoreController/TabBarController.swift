//
//  TabBarController.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = TableViewController(viewModel: HomeViewModel())
        let vc2 = TableViewController(viewModel: FavoriteRecipViewModel())
        
        
        vc1.title = "Reciplease"
        vc2.title = "Favorite"
        let nav1 = NavigationController(rootViewController: vc1)
        let nav2 = NavigationController(rootViewController: vc2)
        
        setViewControllers([nav1, nav2], animated: false)
   
        
    }

}
