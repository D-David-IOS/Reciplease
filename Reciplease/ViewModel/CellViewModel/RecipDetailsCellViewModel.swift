//
//  RecipDetailsCellViewModel.swift
//  Reciplease
//
//  Created by David-IOS on 12/09/2021.
//

import Foundation

class RecipDetailsCellViewModel : TableCellViewModel {
    var height: Float = 199
    
    var estimatedHeight: Float = 199
    
    var indexPath: IndexPath?
    
    var nibName: String? = "RecipDetailsTableViewCell"
    
    lazy var reuseIdentifier: String = String(describing: self)

    var routingEntry: RoutingEntry?

    var recipe : Recipe
    
    init(recipe : Recipe) {
        self.recipe = recipe
    }
    
}
