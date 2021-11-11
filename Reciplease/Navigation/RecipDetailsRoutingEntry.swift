//
//  RecipDetailsRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

// This Routing push a new controller : TableViewController with the viewModel RecipDetailsViewModel
class RecipDetailsRoutingEntry : RoutingEntry {
    
    // instance with a Recipe
    var recipe : Recipe
    
    init(recipe : Recipe){
        self.recipe = recipe
    }
    
    var viewController: Controller? {
        let viewModel = RecipDetailsViewModel(recipe: self.recipe)
        return TableViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}
