//
//  ListControllerRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

// This Routing push a new controller : TableViewController with the viewModel ListRecipViewModel
class RecipListRoutingEntry : RoutingEntry {
 
    var viewController: Controller? {
        let viewModel = ListRecipViewModel()
        return TableViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}
