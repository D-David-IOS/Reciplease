//
//  Navigator.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

protocol Navigator {
    var lastNavigationStyle: NavigationStyle? { get set }
    func visibleViewController() -> Controller?
    func visibleViewController(_ rootViewController: Controller?) -> Controller?
    func route(navigationStyle: NavigationStyle, animated: Bool) -> Navigator
}
