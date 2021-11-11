//
//  RountingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

@objc protocol RoutingEntry {
    
    // navigationStyle is an enum, it reprensent how to show the new controller(push, pop, etc...)
    var navigationStyle: NavigationStyle { get }
    
    // The destination Controller with a specific ViewModel
    var viewController: Controller? { get }
    
    // completion if needed
    var completionBlock: (() -> Void)? { get set }
}
