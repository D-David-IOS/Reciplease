//
//  FavoriteCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteCellViewModel : TableCellViewModel {
    var height: Float = 115
    
    var estimatedHeight: Float = 115
    
    var indexPath: IndexPath?
    
    var nibName: String? = "FavoriteTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    
    var favorite : FavoriteRecipe
    
    init(favoriteRecipe : FavoriteRecipe, routingEntry: RoutingEntry) {
        
        self.favorite = favoriteRecipe
        self.routingEntry = routingEntry
    }
    
}
