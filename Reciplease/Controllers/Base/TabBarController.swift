//
//  TabBarController.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

    // we have no storyboard so we create her the 2 tabs "Home" and "Favorite"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add 2 controller with 1 ViewModel for each
        let vc1 = TableViewController(viewModel: HomeViewModel())
        let vc2 = TableViewController(viewModel: FavoriteRecipViewModel())
        
        vc1.title = "Reciplease"
        vc2.title = "Favorite"
        
        // we create 2 custom Navigation Controller
        // The simulator can display a bad Result in Xcode 13
        let nav1 = NavigationController(rootViewController: vc1)
        let nav2 = NavigationController(rootViewController: vc2)
        
        // we configure the title/image tabs
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "music.note.house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "star.fill"), tag: 1)
        setViewControllers([nav1, nav2], animated: false)
        
    }

}
