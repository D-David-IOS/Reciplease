//
//  RecipDetailsRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsRoutingEntry : RoutingEntry {
    
    var recipe : Recipe
    
    init(recipe : Recipe){
        self.recipe = recipe
    }
    
    var viewController: Controller? {
        let viewModel = RecipDetailsViewModel(recipe: self.recipe)
        return RecipListViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    
}
