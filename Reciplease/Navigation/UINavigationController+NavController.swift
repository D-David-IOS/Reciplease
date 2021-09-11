//
//  UINavigationController+NavController.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation
import UIKit

extension UINavigationController: NavController {
    
    func push(controller: Controller, animated: Bool) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.pushViewController(viewController,
                                animated: animated)
    }
    
    func popController(animated: Bool) {
        self.popViewController(animated: animated)
    }
    
    
}
