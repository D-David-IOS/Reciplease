//
//  FavoriteDetailsRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

// This Routing push a new controller : TableViewController with the viewModel FavoriteDetailsViewModel
class FavoriteDetailsRoutingEntry : RoutingEntry {
    
    // Instance with a FavoriteRecipe
    var favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe){
        self.favorite = favorite
    }
    
    var viewController: Controller? {
        let viewModel = FavoriteDetailsViewModel(favorite: self.favorite)
        return TableViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
}
