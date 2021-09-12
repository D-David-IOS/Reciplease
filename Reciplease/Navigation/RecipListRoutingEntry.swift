//
//  ListControllerRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 11/09/2021.
//

import Foundation

class RecipListRoutingEntry : RoutingEntry {
    var viewController: Controller? {
        let viewModel = ListRecipViewModel()
        return RecipListViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    
}
