//
//  RountingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

@objc protocol RoutingEntry {
    var navigationStyle: NavigationStyle { get }
    var viewController: Controller? { get }
    var completionBlock: (() -> Void)? { get set }
}
