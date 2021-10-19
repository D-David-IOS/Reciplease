//
//  FavoriteDetailsCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 21/09/2021.
//

import Foundation

class FavoriteDetailsCellViewModel : TableCellViewModel {
    var height: Float = 199
    
    var estimatedHeight: Float = 199
    
    var indexPath: IndexPath?
    
    var nibName: String? = "FavoriteDetailsTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?
    
    var favorite : FavoriteRecipe
    
    init(favorite : FavoriteRecipe) {
        self.favorite = favorite
    }
    
}
