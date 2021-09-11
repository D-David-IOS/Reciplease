//
//  UIViewController+Controller.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation
import UIKit

extension UIViewController: Controller {

    var presentedController: Controller? {
        return self.presentedViewController
    }
        
    func present(controller: Controller, animated: Bool, completion: @escaping () -> ()) {
        guard let viewController = controller as? UIViewController else {
            return
        }
        self.present(viewController,
                     animated: animated,
                     completion: completion)
    }
        
    func dismissController(animated: Bool, completion: @escaping () -> ()) {
        self.dismiss(animated: animated, completion: completion)
    }
    
}
