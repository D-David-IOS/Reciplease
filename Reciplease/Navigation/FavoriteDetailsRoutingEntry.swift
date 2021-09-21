//
//  FavoriteDetailsRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsRoutingEntry : RoutingEntry {
    
    var favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe){
        self.favorite = favorite
    }
    
    var viewController: Controller? {
        let viewModel = FavoriteDetailsViewModel(favorite: self.favorite)
        return TableViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    
}
