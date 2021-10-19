//
//  Navigator.swift
//  Weazer
//
//  Created by Florian Basso on 14/04/2019.
//  Copyright © 2019 Roaflin. All rights reserved.
//

import Foundation

protocol Navigator {
    var lastRoutingEntry: RoutingEntry? { get set }
    func visibleViewController() -> Controller?
    func visibleViewController(_ rootViewController: Controller?) -> Controller?
    func route(routingEntry: RoutingEntry,
               fromController: Controller,
               animated: Bool) -> Navigator
}


@objc enum NavigationStyle: Int {
    case push
    case pop
    case modal
    case dismiss
    case url
}
