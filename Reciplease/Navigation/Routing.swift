//
//  Routing.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation
import UIKit

class Routing: NSObject, Navigator {
    
    // MARK: - Navigator
    
    var lastRoutingEntry: RoutingEntry?
    
    func visibleViewController() -> Controller? {
        guard let window = UIApplication.shared.delegate?.window  else {
            return nil
        }
        return self.visibleViewController(window!.rootViewController)
    }
    
    func visibleViewController(_ rootViewController: Controller?) -> Controller? {
        
        if let rootNavigationController = rootViewController as? UINavigationController {
            let lastViewController: UIViewController? = rootNavigationController.viewControllers.last
            return self.visibleViewController(lastViewController)
        } else if let rootTabBarController = rootViewController as? UITabBarController {
            let selectedViewController: UIViewController? = rootTabBarController.selectedViewController
            return visibleViewController(selectedViewController)
        }
        
        if rootViewController?.presentedController == nil {
            return rootViewController
        } else {
            return self.visibleViewController(rootViewController?.presentedController)
        }
    }
    
    func route(routingEntry: RoutingEntry,
               fromController: Controller,
               animated: Bool = true) -> Navigator {
        
        let viewControllerToDisplay = routingEntry.viewController
        
        // Navigate on main thread to avoid crashes
        DispatchQueue.main.async(execute: {() -> Void in
            switch routingEntry.navigationStyle {
                // push a new controller
            case .push:
                
                var fromNavigationController: UINavigationController? = fromController as? UINavigationController
                
                if let navigationController = fromController.navController as? UINavigationController {
                    fromNavigationController = navigationController
                }
                if let aDisplay = viewControllerToDisplay {
                    fromNavigationController?.pushViewController(aDisplay as! UIViewController, animated: animated)
                }
                
                break
                
                // we can use modal for show an AlertViewController
            case .modal:
                if let aDisplay = viewControllerToDisplay {
                    fromController.present(controller: aDisplay,
                                           animated: animated,
                                           completion: {() -> Void in
                                            routingEntry.completionBlock?()
                                           })
                }
                
                break
                // we can use url for open a link in safari, or open an another app like twitter
            case .url :
                guard let route = routingEntry as? WebRoutingEntry else {
                    return
                }
                UIApplication.shared.open(route.url)
                
                break
            }
        })
        
        self.lastRoutingEntry = routingEntry
        return self
    }
}
