//
//  NavigationStyle.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Dispatch
import Foundation

protocol NavigationStyle {
    
    func navigate(animated: Bool)
}

struct PushNavigationStyle: NavigationStyle {
    
    let fromNVC: NavController
    var routingEntry: RoutingEntry?
    
    init(fromNVC: NavController,
         routingEntry: RoutingEntry) {
        self.fromNVC = fromNVC
        self.routingEntry = routingEntry
    }
    
    func navigate(animated: Bool) {
        guard let toVC = self.routingEntry?.viewController else { return }
        
        DispatchQueue.main.async {
            self.fromNVC.push(controller: toVC, animated: animated)
        }
        
    }
}
