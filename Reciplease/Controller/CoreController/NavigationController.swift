//
//  NavigationController.swift
//  Reciplease
//
//  Created by David-IOS on 15/09/2021.
//

import UIKit

class NavigationController: UINavigationController {

        override func viewDidLoad() {
            super.viewDidLoad()
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .never
            navigationBar.barTintColor = #colorLiteral(red: 0.2160621881, green: 0.2001904547, blue: 0.196036458, alpha: 1)
            navigationBar.tintColor = .blue
        }

}
