//
//  NavigationController.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import UIKit

// a custom Navigation Controller
class NavigationController: UINavigationController {

        override func viewDidLoad() {
            super.viewDidLoad()
            navigationBar.barTintColor = #colorLiteral(red: 0.2160621881, green: 0.2001904547, blue: 0.196036458, alpha: 1)
            navigationBar.tintColor = .blue
        }

}
